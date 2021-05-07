<script>
    let who = "Henk";

    function handleClick()
    {
        who = "Ingrid";
    }
</script>

<p class="greeting">Hello, {who}!</p>

<button on:click={handleClick}>who2</button>

<style>
    .greeting
    {
        font-weight: bold;
    }
</style>
