<!-- This is the top-level component of the web app.
     It contains all the other high-level components:
     location, search, restaurant, booking, etc.

     Which components it displays is dependent upon its state.
     The state is manipulated by catching events from the subcomponents. -->

<script>
    import Location from "./Location.svelte";
    import Search from "./Search.svelte";

    let location = null;

    function onLocation(ev)
    {
        location = ev.detail;
    }
</script>

<section
    class="app"
    class:location-unknown={location === null}
    class:location-known={location !== null}
>

    <h1 class="logo">Hap Hap Hap</h1>

    {#if location === null}
        <section class="intro">
            <p>
                Simple as can be restaurant reservation
                for you and your friends.
            </p>
            <p>
                Plant-based and last-minute.
            </p>
        </section>
    {/if}

    <section class="location">
        <Location on:location={onLocation} />
    </section>

    {#if location !== null}
        <section class="search">
            <Search />
        </section>
    {/if}

</section>

<style>

    /* Css grid styling. */
    .location-unknown
    {
        grid-template-areas:
            "logo"
            "intro"
            "location";
    }
    .location-known
    {
        grid-template-areas:
            "logo location filler"
            "search search search";
        grid-template-columns: 1fr 2fr 1fr;
    }
    .app { display: grid; }
    .logo { grid-area: logo; }
    .intro { grid-area: intro; }
    .location { grid-area: location; }
    .search { grid-area: search; }

    /* App styling. */
    .app
    {
        max-width: 60rem;
        margin: 1.8rem auto;
    }

    /* Logo styling. */
    .location-unknown .logo
    {
        font-size: 2rem;
        line-height: 3.6rem;
        text-align: center;
    }

    .location-known .logo
    {
        font-size: 1rem;
        line-height: 1.8rem;
    }

    /* Intro styling. */
    .intro
    {
        text-align: center;

        margin: 1.8rem 0;
    }

    .intro > p
    {
        line-height: 1.8rem;
    }

    /* Location styling. */
    .location
    {
        text-align: center;
    }

</style>
