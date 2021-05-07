// This file configures rollup.
// It is passed to rollup in default.nix.

import css from "rollup-plugin-css-only";
import resolve from "@rollup/plugin-node-resolve";
import svelte from "rollup-plugin-svelte";

export default {

    // This specifies the entry point of the app.
    input: "src/index.js",

    // This specifies where the output is written to,
    // and in which format it is wrapped.
    output: {
        file: "app.js",
        format: "iife",
    },

    // These plugins are applied in order.
    plugins: [

        // Compile svelte code into js and css.
        svelte({}),

        // Combine generated js modules into a single js file.
        resolve({

            // Nix puts node dependencies in separate directories,
            // but by default the resolve plugin only looks in node_modules.
            // Pass the list of directories explicitly using this trick.
            moduleDirectories: process.env.NODE_PATH.split(":"),

            // Generate code for use by the browser.
            browser: true,

        }),

        // Combine generated css stylesheets into a single css file.
        css({
            output: "app.css",
        }),

    ],
};
