import sonarjs from "eslint-plugin-sonarjs";

export default [
  {
    files: ["**/*.{js,mjs,cjs}"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "module",
      globals: {
        console: "readonly",
        process: "readonly",
        Buffer: "readonly",
        URL: "readonly",
      },
    },
    plugins: { sonarjs },
    rules: {
      "no-eval": "error",
      "no-implied-eval": "error",
      "no-new-func": "error",
      "sonarjs/no-identical-functions": "error",
      "sonarjs/cognitive-complexity": ["warn", 40],
    },
  },
];
