<script>

    import { createEventDispatcher } from "svelte";

    const dispatch = createEventDispatcher();

    // The {latitude, longitude} pair as an object,
    // or null if the location is not yet known.
    let location = null;

    // The raw location, as entered by the user.
    let rawLocation = "";

    // Set the location to the raw location,
    // if it can be parsed successfully.
    function commit()
    {
        try {
            const [latitudeS, longitudeS] = rawLocation.split(",", 2);
            const latitude = parseFloat(latitudeS);
            const longitude = parseFloat(longitudeS);
            location = {latitude, longitude};
        } catch (ex) {
            location = null;
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
    on:click={commit}
>
    {#if location === null}
        Let’s go!
    {:else}
        Refresh
    {/if}
</button>

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

</style>
