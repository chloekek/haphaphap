# This file has been generated by node2nix 1.8.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "@rollup/pluginutils-3.1.0" = {
      name = "_at_rollup_slash_pluginutils";
      packageName = "@rollup/pluginutils";
      version = "3.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@rollup/pluginutils/-/pluginutils-3.1.0.tgz";
        sha512 = "GksZ6pr6TpIjHm8h9lSQ8pi8BE9VeubNT0OMJ3B5uZJ8pz73NPiqOtCog/x2/QzM1ENChPKxMDhiQuRHsqc+lg==";
      };
    };
    "@rollup/pluginutils-4.1.0" = {
      name = "_at_rollup_slash_pluginutils";
      packageName = "@rollup/pluginutils";
      version = "4.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@rollup/pluginutils/-/pluginutils-4.1.0.tgz";
        sha512 = "TrBhfJkFxA+ER+ew2U2/fHbebhLT/l/2pRk0hfj9KusXUuRXd2v0R58AfaZK9VXDQ4TogOSEmICVrQAA3zFnHQ==";
      };
    };
    "@types/estree-0.0.39" = {
      name = "_at_types_slash_estree";
      packageName = "@types/estree";
      version = "0.0.39";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/estree/-/estree-0.0.39.tgz";
        sha512 = "EYNwp3bU+98cpU4lAWYYL7Zz+2gryWH1qbdDTidVd6hkiR6weksdbMadyXKXNPEkQFhXM+hVO9ZygomHXp+AIw==";
      };
    };
    "@types/node-15.0.2" = {
      name = "_at_types_slash_node";
      packageName = "@types/node";
      version = "15.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/node/-/node-15.0.2.tgz";
        sha512 = "p68+a+KoxpoB47015IeYZYRrdqMUcpbK8re/zpFB8Ld46LHC1lPEbp3EXgkEhAYEcPvjJF6ZO+869SQ0aH1dcA==";
      };
    };
    "@types/resolve-1.17.1" = {
      name = "_at_types_slash_resolve";
      packageName = "@types/resolve";
      version = "1.17.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/resolve/-/resolve-1.17.1.tgz";
        sha512 = "yy7HuzQhj0dhGpD8RLXSZWEkLsV9ibvxvi6EiJ3bkqLAO1RGo0WbkWQiwpRlSFymTJRz0d3k5LM3kkx8ArDbLw==";
      };
    };
    "builtin-modules-3.2.0" = {
      name = "builtin-modules";
      packageName = "builtin-modules";
      version = "3.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/builtin-modules/-/builtin-modules-3.2.0.tgz";
        sha512 = "lGzLKcioL90C7wMczpkY0n/oART3MbBa8R9OFGE1rJxoVI86u4WAGfEk8Wjv10eKSyTHVGkSo3bvBylCEtk7LA==";
      };
    };
    "deepmerge-4.2.2" = {
      name = "deepmerge";
      packageName = "deepmerge";
      version = "4.2.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/deepmerge/-/deepmerge-4.2.2.tgz";
        sha512 = "FJ3UgI4gIl+PHZm53knsuSFpE+nESMr7M4v9QcgB7S63Kj/6WqMiFQJpBBYz1Pt+66bZpP3Q7Lye0Oo9MPKEdg==";
      };
    };
    "estree-walker-0.6.1" = {
      name = "estree-walker";
      packageName = "estree-walker";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/estree-walker/-/estree-walker-0.6.1.tgz";
        sha512 = "SqmZANLWS0mnatqbSfRP5g8OXZC12Fgg1IwNtLsyHDzJizORW4khDfjPqJZsemPWBB2uqykUah5YpQ6epsqC/w==";
      };
    };
    "estree-walker-1.0.1" = {
      name = "estree-walker";
      packageName = "estree-walker";
      version = "1.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/estree-walker/-/estree-walker-1.0.1.tgz";
        sha512 = "1fMXF3YP4pZZVozF8j/ZLfvnR8NSIljt56UhbZ5PeeDmmGHpgpdwQt7ITlGvYaQukCvuBRMLEiKiYC+oeIg4cg==";
      };
    };
    "estree-walker-2.0.2" = {
      name = "estree-walker";
      packageName = "estree-walker";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/estree-walker/-/estree-walker-2.0.2.tgz";
        sha512 = "Rfkk/Mp/DL7JVje3u18FxFujQlTNR2q6QfMSMB7AvCBx91NGj/ba3kCfza0f6dVDbw7YlRf/nDrn7pQrCCyQ/w==";
      };
    };
    "function-bind-1.1.1" = {
      name = "function-bind";
      packageName = "function-bind";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/function-bind/-/function-bind-1.1.1.tgz";
        sha512 = "yIovAzMX49sF8Yl58fSCWJ5svSLuaibPxXQJFLmBObTuCr0Mf1KiPopGM9NiFjiYBCbfaa2Fh6breQ6ANVTI0A==";
      };
    };
    "has-1.0.3" = {
      name = "has";
      packageName = "has";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/has/-/has-1.0.3.tgz";
        sha512 = "f2dvO0VU6Oej7RkWJGrehjbzMAjFp5/VKPp5tTpWIV4JHHZK1/BxbFRtf/siA2SWTe09caDmVtYYzWEIbBS4zw==";
      };
    };
    "is-core-module-2.3.0" = {
      name = "is-core-module";
      packageName = "is-core-module";
      version = "2.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-core-module/-/is-core-module-2.3.0.tgz";
        sha512 = "xSphU2KG9867tsYdLD4RWQ1VqdFl4HTO9Thf3I/3dLEfr0dbPTWKsuCKrgqMljg4nPE+Gq0VCnzT3gr0CyBmsw==";
      };
    };
    "is-module-1.0.0" = {
      name = "is-module";
      packageName = "is-module";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-module/-/is-module-1.0.0.tgz";
        sha1 = "3258fb69f78c14d5b815d664336b4cffb6441591";
      };
    };
    "path-parse-1.0.6" = {
      name = "path-parse";
      packageName = "path-parse";
      version = "1.0.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-parse/-/path-parse-1.0.6.tgz";
        sha512 = "GSmOT2EbHrINBf9SR7CDELwlJ8AENk3Qn7OikK4nFYAu3Ote2+JYNVvkpAEQm3/TLNEJFD/xZJjzyxg3KBWOzw==";
      };
    };
    "picomatch-2.2.3" = {
      name = "picomatch";
      packageName = "picomatch";
      version = "2.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/picomatch/-/picomatch-2.2.3.tgz";
        sha512 = "KpELjfwcCDUb9PeigTs2mBJzXUPzAuP2oPcA989He8Rte0+YUAjw1JVedDhuTKPkHjSYzMN3npC9luThGYEKdg==";
      };
    };
    "require-relative-0.8.7" = {
      name = "require-relative";
      packageName = "require-relative";
      version = "0.8.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/require-relative/-/require-relative-0.8.7.tgz";
        sha1 = "7999539fc9e047a37928fa196f8e1563dabd36de";
      };
    };
    "resolve-1.20.0" = {
      name = "resolve";
      packageName = "resolve";
      version = "1.20.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/resolve/-/resolve-1.20.0.tgz";
        sha512 = "wENBPt4ySzg4ybFQW2TT1zMQucPK95HSh/nq2CFTZVOGut2+pQvSsgtda4d26YrYcr067wjbmzOG8byDPBX63A==";
      };
    };
    "rollup-pluginutils-2.8.2" = {
      name = "rollup-pluginutils";
      packageName = "rollup-pluginutils";
      version = "2.8.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/rollup-pluginutils/-/rollup-pluginutils-2.8.2.tgz";
        sha512 = "EEp9NhnUkwY8aif6bxgovPHMoMoNr2FulJziTndpt5H9RdwC47GSGuII9XxpSdzVGM0GWrNPHV6ie1LTNJPaLQ==";
      };
    };
  };
in
{
  "@rollup/plugin-node-resolve" = nodeEnv.buildNodePackage {
    name = "_at_rollup_slash_plugin-node-resolve";
    packageName = "@rollup/plugin-node-resolve";
    version = "13.0.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/@rollup/plugin-node-resolve/-/plugin-node-resolve-13.0.0.tgz";
      sha512 = "41X411HJ3oikIDivT5OKe9EZ6ud6DXudtfNrGbC4nniaxx2esiWjkLOzgnZsWq1IM8YIeL2rzRGLZLBjlhnZtQ==";
    };
    dependencies = [
      sources."@rollup/pluginutils-3.1.0"
      sources."@types/estree-0.0.39"
      sources."@types/node-15.0.2"
      sources."@types/resolve-1.17.1"
      sources."builtin-modules-3.2.0"
      sources."deepmerge-4.2.2"
      sources."estree-walker-1.0.1"
      sources."function-bind-1.1.1"
      sources."has-1.0.3"
      sources."is-core-module-2.3.0"
      sources."is-module-1.0.0"
      sources."path-parse-1.0.6"
      sources."picomatch-2.2.3"
      sources."resolve-1.20.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Locate and bundle third-party dependencies in node_modules";
      homepage = "https://github.com/rollup/plugins/tree/master/packages/node-resolve/#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
  rollup-plugin-css-only = nodeEnv.buildNodePackage {
    name = "rollup-plugin-css-only";
    packageName = "rollup-plugin-css-only";
    version = "3.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/rollup-plugin-css-only/-/rollup-plugin-css-only-3.1.0.tgz";
      sha512 = "TYMOE5uoD76vpj+RTkQLzC9cQtbnJNktHPB507FzRWBVaofg7KhIqq1kGbcVOadARSozWF883Ho9KpSPKH8gqA==";
    };
    dependencies = [
      sources."@rollup/pluginutils-4.1.0"
      sources."estree-walker-2.0.2"
      sources."picomatch-2.2.3"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Rollup plugin that bundles imported css";
      homepage = https://github.com/thgh/rollup-plugin-css-only;
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
  rollup-plugin-svelte = nodeEnv.buildNodePackage {
    name = "rollup-plugin-svelte";
    packageName = "rollup-plugin-svelte";
    version = "7.1.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/rollup-plugin-svelte/-/rollup-plugin-svelte-7.1.0.tgz";
      sha512 = "vopCUq3G+25sKjwF5VilIbiY6KCuMNHP1PFvx2Vr3REBNMDllKHFZN2B9jwwC+MqNc3UPKkjXnceLPEjTjXGXg==";
    };
    dependencies = [
      sources."estree-walker-0.6.1"
      sources."require-relative-0.8.7"
      sources."rollup-pluginutils-2.8.2"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Compile Svelte components with Rollup";
      homepage = "https://github.com/sveltejs/rollup-plugin-svelte#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
  svelte = nodeEnv.buildNodePackage {
    name = "svelte";
    packageName = "svelte";
    version = "3.38.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/svelte/-/svelte-3.38.2.tgz";
      sha512 = "q5Dq0/QHh4BLJyEVWGe7Cej5NWs040LWjMbicBGZ+3qpFWJ1YObRmUDZKbbovddLC9WW7THTj3kYbTOFmU9fbg==";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Cybernetically enhanced web apps";
      homepage = "https://github.com/sveltejs/svelte#README";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}