// This file contains the entry point to the web app.

import App from "./App.svelte";

// Merely instantiating the class will install the app in the document.
// It happens as a side effect of the constructor.
new App({ target: document.body });
