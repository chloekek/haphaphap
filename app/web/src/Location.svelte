<!-- This component presents the location form,
     and handles the conversion from input to coordinates.
     It fires one event, ‘location’, whose details is the coordinates.
     It won’t fire this event until the coordinates are actually known,
     and it will never transition back into the ‘unknown coordinates’ state. -->

<script>

    import { createEventDispatcher } from "svelte";

    const dispatch = createEventDispatcher();

    // The {latitude, longitude} pair as an object,
    // or null if the location is not yet known.
    let location = null;

    // The raw location, as entered by the user.
    let rawLocation = "";

    // Whether we are currently in the process of geocoding.
    let busyGeocoding = false;

    // The error that occurs when geocoding the location,
    // or null if there was no error yet.
    let error = null;

    // Set the location to the raw location,
    // by contacting the geolocation api.
    async function commit()
    {
        // Block any commits until we are done,
        // and show to the user that we are busy.
        busyGeocoding = true;

        try {

            // See the documentation at [1] for how this api is used.
            // [1]: https://nominatim.org/release-docs/develop/api/Search/
            const osmUrl = "https://nominatim.openstreetmap.org";
            const qParam = encodeURIComponent(rawLocation);
            const url = `${osmUrl}/search?q=${qParam}&format=json`;

            // Request the results.
            const response = await fetch(url);
            const json = await response.json();

            // Check that there is at least one matching location.
            if (json.length === 0)
                throw Error("No matching locations found");

            // Set the location and clear the error.
            const latitude = parseFloat(json[0].lat);
            const longitude = parseFloat(json[0].lon);
            location = {latitude, longitude};
            error = null;

        } catch (ex) {

            // Display the error to the user.
            error = ex;

        } finally {

            // No longer geocoding now.
            busyGeocoding = false;

        }
    }

    // When the location is no longer unset,
    // dispatch the location event to the app.
    $: {
        if (location !== null)
            dispatch("location", location);
    }

</script>

<!-- The field in which to enter the raw location. -->
<input
    class="field"
    type="text"
    placeholder="Location"
    bind:value={rawLocation}
>

<!-- The button to commit the raw location. -->
<button
    class="button"
    type="button"
    disabled={busyGeocoding}
    on:click={commit}
>
    {#if busyGeocoding}
        Loading …
    {:else if location === null}
        Let’s go!
    {:else}
        Refresh
    {/if}
</button>

{#if error !== null}
    <p class="error">
        {error}
    </p>
{/if}

<style>

    .field
    {
        border: solid 1px green;

        font: inherit;
        line-height: calc(1.8rem - 2px);

        padding: 0 0.45rem;
    }

    .button
    {
        background: lime;
        border: solid 1px green;

        font: inherit;
        line-height: calc(1.8rem - 2px);

        padding: 0 0.45rem;
    }

    .error
    {
        border: solid 1px red;

        line-height: calc(1.8rem - 2px);

        margin-top: 1.8rem;
    }

</style>
