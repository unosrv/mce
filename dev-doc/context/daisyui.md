### Install Dependencies and Run Development Server with npm

Source: https://daisyui.com/blog/daisyui-astro-tailwind-documentation-template

Install project dependencies and start the development server for the daisyUI Documentation Template. Execute these commands in sequence from the project directory to set up the local development environment.

```bash
npm install
```

```bash
npm run dev
```

--------------------------------

### Create Solid Start Project using npm

Source: https://daisyui.com/docs/install/solid-start

Initializes a new Solid Start project in the current directory using npm. This command requires Node.js and npm to be installed.

```bash
npm init solid@latest ./

```

--------------------------------

### Install Dependencies and Run Development Server

Source: https://daisyui.com/stackblitz

This command sequence first installs all necessary project dependencies defined in 'package.json' using npm. Following successful installation, it starts the development server using the 'dev' script, which is configured to run Vite.

```bash
npm install && npm run dev
```

--------------------------------

### Navigate and Run SvelteKit Development Server

Source: https://daisyui.com/blog/how-to-install-sveltekit-and-daisyui

After creating the SvelteKit project, these commands navigate into the project directory, install its dependencies, and start the development server. The server opens automatically in the default browser.

```bash
cd my-app
npm install
npm run dev -- --open
```

--------------------------------

### daisyUI CDN Setup with Tailwind CSS

Source: https://daisyui.com/pages/ui-library-for-hackaton

Demonstrates the minimal setup required to start using daisyUI for rapid prototyping. Includes HTML5 boilerplate with daisyUI and Tailwind CSS loaded via CDN links, enabling immediate development without build tools, package managers, or configuration files. Includes a simple button component example.

```html
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Hackathon Project</title>
  <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body>
  <button class="btn btn-primary">Let's build!</button>
</body>
</html>
```

--------------------------------

### Build CSS and Run Project (Terminal)

Source: https://daisyui.com/docs/install/electron

Commands to first build the project's CSS using the configured Tailwind and daisyUI setup, and then start the Electron application. These commands rely on the scripts defined in `package.json`.

```bash
npm run build:css
npm start
```

--------------------------------

### Create a New SvelteKit Project

Source: https://daisyui.com/blog/how-to-install-sveltekit-and-daisyui

This command initializes a new SvelteKit project using npm. It prompts the user to select a project template, with 'Skeleton project' being recommended for a barebones setup.

```bash
npm create svelte@latest my-app
```

--------------------------------

### Install daisyUI with npm

Source: https://daisyui.com/blog/npm-init-daisyui

Use this command to initiate the daisyUI installation and setup process. It guides you through options for integrating Tailwind CSS and daisyUI.

```bash
npm init daisyui
```

--------------------------------

### Run Dioxus development server

Source: https://daisyui.com/docs/install/dioxus

Starts the Dioxus development server, typically used for live previewing and hot-reloading of the Dioxus application.

```bash
dx serve
```

--------------------------------

### Example Prompt with daisyUI GitMCP Server

Source: https://daisyui.com/docs/editor/cursor

An example prompt for using the daisyUI GitMCP server. When this server is configured, simply asking for DaisyUI components or themes will leverage this server for responses, without needing an explicit 'use' command.

```plaintext
give me a light daisyUI 5 theme with tropical color palette
```

--------------------------------

### Run Deno Fresh Development Server

Source: https://daisyui.com/docs/install/fresh

Starts the development server for the Deno Fresh project. This command enables hot-reloading and allows you to view daisyUI components in real-time during development.

```bash
deno task dev
```

--------------------------------

### Example Prompt with Context7 MCP

Source: https://daisyui.com/docs/editor/cursor

An example prompt showing how to activate the 'Context7' MCP server within Cursor's 'Agent Mode'. Appending 'use context7' to your prompt directs the AI to use this specific server for DaisyUI-related tasks.

```plaintext
give me a light daisyUI 5 theme with tropical color palette. use context7
```

--------------------------------

### Run Yew Development Server

Source: https://daisyui.com/docs/install/yew

Starts the Trunk development server, enabling live reloading, and automatically opens the Yew application in the default web browser.

```bash
trunk serve --open

```

--------------------------------

### Create New Content Page Structure (MDX)

Source: https://daisyui.com/blog/daisyui-astro-tailwind-documentation-template

This example demonstrates how to create a new content page using MDX format. It includes frontmatter for title and description, and basic Markdown content with an overview of features. This structure is used for adding new documentation sections.

```mdx
---
title: Getting Started
description: "Quasi sapiente voluptates aut minima non doloribus similique quisquam. In quo expedita ipsum nostrum corrupti incidunt. Et aut eligendi ea perferendis."
---

<script>
  import Translate from "$components/Translate.svelte"
</script>

## Overview

Authentication is a crucial aspect of any web application, ensuring that users are who they claim to be before granting access to resources or sensitive information. Access Shield simplifies the process of user authentication, offering features such as:

- **User Registration and Login**: Allow users to create accounts and securely log in to your application.
- **Password Hashing and Encryption**: Safeguard user passwords by securely hashing and encrypting them before storage.
- **Session Management**: Manage user sessions to maintain authentication state across requests.
- **OAuth Integration**: Simplify user authentication by integrating with popular OAuth providers.
- **Two-Factor Authentication (2FA)**: Enhance security by requiring an additional authentication factor.
- **Role-Based Access Control (RBAC)**: Define roles and permissions to control access to resources.
```

--------------------------------

### Example Prompt with daisyUI Blueprint MCP

Source: https://daisyui.com/docs/editor/cursor

An example prompt demonstrating how to utilize the configured 'daisyui-blueprint' MCP server. By appending 'use Blueprint MCP' to your prompt, you instruct Cursor to leverage this server for generating DaisyUI code.

```plaintext
give me a light daisyUI 5 theme with tropical color palette. use Blueprint MCP
```

--------------------------------

### Install daisyUI with Bun

Source: https://daisyui.com/blog/npm-init-daisyui

Utilize this command for a swift setup of Tailwind CSS and daisyUI when working with the Bun package manager.

```bash
bun create daisyui
```

--------------------------------

### Alternative npm command for daisyUI

Source: https://daisyui.com/blog/npm-init-daisyui

This command serves as an alias for `npm init daisyui`, offering an alternative syntax for initiating the daisyUI installation and Tailwind CSS setup.

```bash
npm create daisyui
```

--------------------------------

### Start Rails Server

Source: https://daisyui.com/docs/install/rails

Command to start the Rails development server.

```bash
./bin/dev
```

--------------------------------

### Install daisyUI 5 Alpha using npm

Source: https://daisyui.com/blog/daisyui-5-alpha

Installs the alpha version of daisyUI as a development dependency. This is the initial step to start using the new alpha features.

```bash
npm i -D daisyui@alpha
```

--------------------------------

### Install daisyUI with Yarn

Source: https://daisyui.com/blog/npm-init-daisyui

This command is the equivalent of `npm init daisyui` when using Yarn for package management. It streamlines the setup of Tailwind CSS and daisyUI.

```bash
yarn create daisyui
```

--------------------------------

### Create Elysia Project with Bun

Source: https://daisyui.com/docs/install/elysia

Initializes a new Elysia project using Bun and navigates into the project directory. Requires Bun to be installed.

```bash
bun create elysia myapp
cd myapp
```

--------------------------------

### Installing Mary UI on a New Laravel Project

Source: https://daisyui.com/blog/mary-ui

Provides the composer command to install the Mary UI package and the artisan command to complete the setup for a new Laravel project. It also includes a command to start the development server.

```bash
composer require robsontenorio/mary
php artisan mary:install
yarn dev
```

--------------------------------

### Initialize Node.js Project and Set Scripts (Terminal)

Source: https://daisyui.com/docs/install/electron

Initializes a new Node.js project using `npm init` and sets custom scripts for starting the Electron application and building CSS using Tailwind. Ensures the entry point is `main.js`.

```bash
mkdir myapp
cd myapp
npm init
npm pkg set scripts.start="electron ."
npm pkg set scripts.build:css="tailwindcss -i src/input.css -o public/output.css"
```

--------------------------------

### Create New Elixir Phoenix Project

Source: https://daisyui.com/docs/install/phoenix

Command to create a new Elixir Phoenix project in the current directory. The `--no-ecto` flag is used here to skip database setup for demonstration.

```bash
mix phx.new ./ --no-ecto
```

--------------------------------

### Create SvelteKit Project

Source: https://daisyui.com/docs/install/sveltekit

Initializes a new SvelteKit project in the current directory using the 'sv create' command. This is the first step before installing Tailwind CSS and daisyUI.

```bash
npx sv create ./
```

--------------------------------

### Install Project Dependencies (npm)

Source: https://daisyui.com/blog/daisyui-nextjs-online-store-template

Installs the necessary packages for the project using npm. This is a prerequisite for running the development server and building the project.

```bash
npm install
```

--------------------------------

### Configure Tailwind CSS in Vite for Solid Start

Source: https://daisyui.com/docs/install/solid-start

Adds the Tailwind CSS plugin to the Vite configuration for a Solid Start project. This ensures Tailwind CSS is processed correctly during the build and development phases.

```typescript
import { defineConfig } from "@solidjs/start/config";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  vite: {
    plugins: [tailwindcss()],
  },
});

```

--------------------------------

### Project-Level Setup: Saving daisyUI Docs for Copilot

Source: https://daisyui.com/docs/editor/vscode

This command saves the daisyUI documentation text file to a specified location within your project, enabling Copilot to use it as a default reference for code generation. Ensure you have `curl` installed to execute this command.

```shell
curl -L https://daisyui.com/llms.txt --create-dirs -o .github/instructions/daisyui.instructions.md
```

--------------------------------

### Create and Navigate Laravel Project

Source: https://daisyui.com/docs/install/laravel

This snippet demonstrates the commands to create a new Laravel project and navigate into its directory using the Laravel installer and terminal.

```shell
laravel new my-app
cd my-app
```

--------------------------------

### Run Zola Development Server

Source: https://daisyui.com/docs/install/zola

Starts the Zola development server, allowing you to preview your static site locally. This command should be run in a separate terminal tab.

```bash
zola serve
```

--------------------------------

### Create New Qwik Project

Source: https://daisyui.com/docs/install/qwik

Command to generate a new, empty Qwik project in the current directory. This is the initial step for setting up a Qwik application.

```bash
npm create qwik@latest empty ./
```

--------------------------------

### Start Development Server (npm)

Source: https://daisyui.com/blog/daisyui-nextjs-online-store-template

Launches the development server, allowing you to preview your online store in real-time at http://localhost:3000. This command is essential for iterative development and testing.

```bash
npm run dev
```

--------------------------------

### Initialize Node.js Project and Scripts

Source: https://daisyui.com/docs/install/11ty

Initializes a new Node.js project and sets up 'dev' and 'build' scripts for Eleventy. These scripts are essential for running and building the static site.

```bash
npm init -y
npm pkg set scripts.dev="eleventy --serve"
npm pkg set scripts.build="eleventy"
```

--------------------------------

### Run Angular Development Server

Source: https://daisyui.com/docs/install/angular

Starts the Angular development server, which builds and serves your Angular application. This command allows you to see your changes live during development and test the integration of daisyUI.

```bash
ng serve
```

--------------------------------

### Install daisyUI using NPM, PNPM, Yarn, Bun, or Deno

Source: https://daisyui.com/alternative/heroui

These commands demonstrate how to install the latest version of daisyUI as a development dependency using various package managers. Ensure you have the respective package manager installed on your system.

```bash
npm i -D daisyui@latest
```

```bash
pnpm add -D daisyui@latest
```

```bash
yarn add -D daisyui@latest
```

```bash
bun add -D daisyui@latest
```

```bash
deno i -D npm:daisyui@latest
```

--------------------------------

### Run Elixir Phoenix Project

Source: https://daisyui.com/docs/install/phoenix

Command to start the Elixir Phoenix project server. After running this, daisyUI class names can be used within the project.

```bash
mix phx.server
```

--------------------------------

### Install daisyUI using Bun

Source: https://daisyui.com/alternative/tailwindui

Installs the latest version of daisyUI as a development dependency using bun.

```bash
bun add -D daisyui@latest
```

--------------------------------

### Fast Install Tailwind CSS and daisyUI (Linux/macOS)

Source: https://daisyui.com/docs/install/django

Installs Tailwind CSS and daisyUI quickly on Linux or macOS by downloading executables and creating an input.css file. This command automates the setup process in the static CSS directory.

```shell
cd myapp/static/css && curl -sL daisyui.com/fast | bash
```

--------------------------------

### Configure input.css for daisyUI and Tailwind

Source: https://daisyui.com/docs/install/standalone

An example `input.css` file demonstrating how to import Tailwind CSS, specify source files, and include daisyUI plugins and custom themes.

```css
@import "tailwindcss";

@source not "./tailwindcss";
@source not "./daisyui{,*}.mjs";

@plugin "./daisyui.mjs";

/* Optional for custom themes – Docs: https://daisyui.com/docs/themes/#how-to-add-a-new-custom-theme */
@plugin "./daisyui-theme.mjs"{
  /* custom theme here */
}
```

--------------------------------

### Configure daisyUI GitMCP server in Windsurf

Source: https://daisyui.com/docs/editor/windsurf

Setup daisyUI GitMCP server for Windsurf integration using Git MCP protocol. Connects directly to the daisyUI GitHub repository for real-time component documentation and code generation without local installation.

```json
{
  "mcpServers": {
    "daisyui-github": {
      "serverUrl": "https://gitmcp.io/saadeghi/daisyui"
    }
  }
}
```

--------------------------------

### Fetch daisyUI LLM Documentation in Zed Chat

Source: https://daisyui.com/docs/editor/zed

Quick method to fetch daisyUI documentation directly in Zed's thread chat. This command imports the compact llms.txt file from daisyui.com to provide context for AI code generation without requiring MCP server setup.

```text
@fetch https://daisyui.com/llms.txt
```

--------------------------------

### Create Next.js Project

Source: https://daisyui.com/docs/install/nextjs

Command to initialize a new Next.js project in the current directory. This sets up the basic structure for a Next.js application.

```bash
npm create next-app@latest ./
```

--------------------------------

### DaisyUI Steps Component Example

Source: https://daisyui.com/codepen

Demonstrates the 'steps' component in DaisyUI, used for visualizing a process or a sequence of stages. This example shows steps with primary styling and subsequent steps without specific styling.

```html
<ul class="steps my-4 w-full">
  <li class="step step-primary">Register</li>
  <li class="step step-primary">Choose plan</li>
  <li class="step">Purchase</li>
  <li class="step">Receive Product</li>
</ul>
```

--------------------------------

### Quick Setup with CDN using HTML

Source: https://daisyui.com/pages/css-framework-for-school-project

This snippet demonstrates the quickest way to set up daisyUI and Tailwind CSS using CDNs directly in an HTML file. It requires no build tools and allows immediate use of daisyUI components and Tailwind utility classes. The output is a simple button styled by daisyUI.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My School Project</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  </head>
  <body class="p-8">
    <button class="btn">Hello, world!</button>
  </body>
</html>
```

--------------------------------

### DaisyUI Kbd Component: HTML Example

Source: https://daisyui.com/llms

Provides the syntax for the DaisyUI kbd component, used to style keyboard shortcuts. Apply the 'kbd' class to the element, and optionally use size modifiers like `kbd-xs`, `kbd-sm`, `kbd-md`, `kbd-lg`, `kbd-xl`.

```html
<kbd class="kbd {MODIFIER}">K</kbd>
```

--------------------------------

### Stacked Cards (Start Direction) HTML Example

Source: https://daisyui.com/components/stack

Demonstrates how to stack cards from the start of the container using DaisyUI's 'stack-start' class. This arrangement is useful for creating layered visual effects where elements appear to build from the beginning.

```html
<div class="stack stack-start size-28">
  <div class="border-base-content card bg-base-100 border text-center">
    <div class="card-body">A</div>
  </div>
  <div class="border-base-content card bg-base-100 border text-center">
    <div class="card-body">B</div>
  </div>
  <div class="border-base-content card bg-base-100 border text-center">
    <div class="card-body">C</div>
  </div>
</div>
```

```jsx
<div className="stack stack-start size-28">
  <div className="border-base-content card bg-base-100 border text-center">
    <div className="card-body">A</div>
  </div>
  <div className="border-base-content card bg-base-100 border text-center">
    <div className="card-body">B</div>
  </div>
  <div className="border-base-content card bg-base-100 border text-center">
    <div className="card-body">C</div>
  </div>
</div>
```

--------------------------------

### Install daisyUI using Deno

Source: https://daisyui.com/alternative/tailwindui

Installs the latest version of daisyUI as a development dependency using Deno.

```bash
deno i -D npm:daisyui@latest
```

--------------------------------

### Run Elysia Development Server

Source: https://daisyui.com/docs/install/elysia

Starts the Elysia development server using the `dev` script defined in `package.json`. This command compiles the TypeScript code and runs the server.

```bash
bun run dev
```

--------------------------------

### Add daisyUI Button Component to SvelteKit Page

Source: https://daisyui.com/blog/how-to-install-sveltekit-and-daisyui

This example demonstrates how to add a daisyUI primary button to the `src/routes/+page.svelte` file. Simply include the `btn btn-primary` classes to any button element to apply daisyUI's styling.

```svelte
<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
<button class="btn btn-primary">Hello daisyUI</button>

```

--------------------------------

### Run Tailwind CSS CLI watcher

Source: https://daisyui.com/docs/install/dioxus

Starts the Tailwind CSS CLI in watch mode. It takes `tailwind.css` as input and outputs the processed CSS to `assets/main.css`, recompiling automatically on changes.

```bash
npx @tailwindcss/cli -i ./tailwind.css -o ./assets/main.css --watch
```

--------------------------------

### Create Nuxt Project

Source: https://daisyui.com/docs/install/nuxt

Command to initialize a new Nuxt project in the current directory. This sets up the basic structure for a Nuxt application.

```bash
npx nuxi@latest init ./
```

--------------------------------

### daisyUI Example Card Component

Source: https://daisyui.com/pages/install-tailwind-css-vite

An HTML structure for a card component styled using daisyUI component classes. This version is more concise than the pure Tailwind CSS version.

```html
<div class="card w-96">
  <figure><img src="https://placehold.co/400x200" alt="Card image" /></figure>
  <div class="card-body">
    <h2 class="card-title">daisyUI Card</h2>
    <p>This card uses daisyUI component classes.</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Read more</button>
    </div>
  </div>
</div>
```

--------------------------------

### Create and Navigate Waku Project using npm

Source: https://daisyui.com/docs/install/waku

This command initializes a new Waku project named 'myapp' and then navigates the user into the newly created project directory. It requires Node.js and npm to be installed.

```bash
npm create waku@latest -- --project-name=myapp
cd myapp
```

--------------------------------

### Create Rsbuild Project

Source: https://daisyui.com/docs/install/rsbuild

This command initializes a new Rsbuild project in the current directory.

```bash
npm create rsbuild -d ./

```

--------------------------------

### Drawer Component Syntax and Usage (HTML)

Source: https://daisyui.com/llms

Defines the basic structure of a DaisyUI drawer, including the toggle input, content area, and sidebar. It also shows how to use a label to control the drawer's visibility and provides examples for responsive sidebars.

```html
<div class="drawer {MODIFIER}">
  <input id="my-drawer" type="checkbox" class="drawer-toggle" />
  <div class="drawer-content">{CONTENT}</div>
  <div class="drawer-side">{SIDEBAR}</div>
</div>

<label for="my-drawer" class="btn drawer-button">Open/close drawer</label>
```

```html
<ul class="menu p-4 w-80 min-h-full bg-base-100 text-base-content">
  <li><a>Item 1</a></li>
  <li><a>Item 2</a></li>
</ul>
```

```html
<div class="drawer lg:drawer-open">
  <input id="my-drawer-3" type="checkbox" class="drawer-toggle" />
  <div class="drawer-content flex flex-col items-center justify-center">
    <!-- Page content here -->
    <label for="my-drawer-3" class="btn drawer-button lg:hidden">
      Open drawer
    </label>
  </div>
  <div class="drawer-side">
    <label for="my-drawer-3" aria-label="close sidebar" class="drawer-overlay"></label>
    <ul class="menu bg-base-200 min-h-full w-80 p-4">
      <!-- Sidebar content here -->
      <li><button>Sidebar Item 1</button></li>
      <li><button>Sidebar Item 2</button></li>
    </ul>
  </div>
</div>
```

```html
<div class="drawer lg:drawer-open">
  <input id="my-drawer-4" type="checkbox" class="drawer-toggle" />
  <div class="drawer-content">
    <!-- Page content here -->
  </div>
  <div class="drawer-side is-drawer-close:overflow-visible">
    <label for="my-drawer-4" aria-label="close sidebar" class="drawer-overlay"></label>
    <div class="is-drawer-close:w-14 is-drawer-open:w-64 bg-base-200 flex flex-col items-start min-h-full">
      <!-- Sidebar content here -->
      <ul class="menu w-full grow">
        <!-- list item -->
        <li>
          <button class="is-drawer-close:tooltip is-drawer-close:tooltip-right" data-tip="Homepage">
            🏠
            <span class="is-drawer-close:hidden">Homepage</span>
          </button>
        </li>
        <!-- list item -->
        <li>
          <button class="is-drawer-close:tooltip is-drawer-close:tooltip-right" data-tip="Settings">
            ⚙️
            <span class="is-drawer-close:hidden">Settings</span>
          </button>
        </li>
      </ul>
      <!-- button to open/close drawer -->
      <div class="m-2 is-drawer-close:tooltip is-drawer-close:tooltip-right" data-tip="Open">
        <label for="my-drawer-4" class="btn btn-ghost btn-circle drawer-button is-drawer-open:rotate-y-180">
          ↔️
        </label>
      </div>
    </div>
  </div>
</div>
```

--------------------------------

### Configure Context7 MCP Server in Claude Desktop

Source: https://daisyui.com/docs/editor/claude

This JSON configuration integrates the Context7 MCP server into Claude desktop. It uses npx to install and run the Context7 MCP package. Users can then include 'use context7' in their prompts for daisyUI code generation.

```json
{
  "mcpServers": {
    "Context7": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

--------------------------------

### Initialize Zola Project and Navigate

Source: https://daisyui.com/docs/install/zola

Initializes a new Zola project and changes the directory into the newly created project folder. This is the first step in setting up the Zola environment.

```bash
zola init myblog
cd myblog
```

--------------------------------

### Install UnoCSS, daisyUI, and Preset

Source: https://daisyui.com/docs/install/unocss

Installs necessary npm packages: UnoCSS for utility-first CSS, daisyUI for component styling, and the UnoCSS preset for daisyUI.

```bash
npm install unocss daisyui @ameinhardt/unocss-preset-daisy
```

--------------------------------

### Create New Vike Project

Source: https://daisyui.com/docs/install/vike

Initializes a new Vike project in the current directory using npm. This command sets up the basic structure for a Vike application.

```bash
npm create vike ./
```

--------------------------------

### Create Solid.js Project

Source: https://daisyui.com/docs/install/solid

Command to generate a new Solid.js project using the degit template. This initializes the project structure in the current directory.

```shell
npx degit solidjs/templates/js
```

--------------------------------

### Electron Main Process (`main.js`)

Source: https://daisyui.com/docs/install/electron

Defines the main process for an Electron application. It sets up the application's main window and loads the `index.html` file from the `src` directory upon successful app startup.

```javascript
const { app, BrowserWindow } = require('electron')

const createWindow = () => {
  const win = new BrowserWindow()
  win.loadFile('src/index.html')
}

app.whenReady().then(() => {
  createWindow()
})
```

--------------------------------

### Create New Blog Post with Markdown Front Matter

Source: https://daisyui.com/blog/how-to-make-a-blog-quickly-using-astro-and-daisyUI

Create a new blog post by adding an .mdx file to src/content/posts directory with YAML front matter metadata and Markdown content. The front matter includes title, description, date, author, and category information.

```markdown
---
title: Boosting Sales with Effective Search Engine Optimization (SEO)
description: Lorem ipsum dolor sit, amet consectetur adipisicing elit. Hic eos odit sequi minima iure natus, odio tempora sit Lorem ipsum dolor sit.
date: 2024/01/12
image: ./images/post-1.jpg
author: antonio
authorImage: /images/about.jpeg
category: seo
---

<script>
  import Translate from "$components/Translate.svelte"
</script>

## **Introduction**

In the digital age, a strong online presence is crucial for businesses looking to thrive. One of the key components of a successful online strategy is Search Engine Optimization (SEO). By optimizing your website for search engines, you can significantly improve your visibility, attract more potential customers, and ultimately boost your sales. In this article, we'll explore some essential SEO strategies to help you achieve these goals.
```

--------------------------------

### Install daisyUI using PNPM

Source: https://daisyui.com/alternative/tailwindui

Installs the latest version of daisyUI as a development dependency using pnpm.

```bash
pnpm add -D daisyui@latest
```

--------------------------------

### Eleventy Markdown Homepage

Source: https://daisyui.com/docs/install/11ty

A sample markdown file for an Eleventy homepage. It uses the default layout and includes markdown headings and a div with a daisyUI button, demonstrating component usage.

```markdown
---
layout: layouts/default.njk
---

# Markdown heading 1

## Markdown heading 2

### Markdown heading 3

<div class="not-prose">
  <button class="btn">daisyUI Button</button>
</div>
```

--------------------------------

### Configure Homepage Layout with Astro Components

Source: https://daisyui.com/blog/how-to-make-a-blog-quickly-using-astro-and-daisyUI

Structure the homepage using Astro by importing and composing multiple components including Hero, TopArticles, LatestBlogs, and others. This demonstrates component-based architecture for organizing blog page sections.

```astro
---
import Hero from "../components/Hero.astro";
import TopArticles from "../components/TopArticles.astro";
import LatestBlogs from "../components/RecentBlogs.astro";
import NewsletterCard from "../components/NewsletterCard.astro";
import FeaturedPost from "../components/FeaturedPost.astro";
import HomeLayout from "../layouts/HomeLayout.astro";
---

<script>
  import Translate from "$components/Translate.svelte"
</script>

<HomeLayout title="Home" description="Welcome to my blog">
  <div class="w-full">
    <Hero />
    <div class="px-5 xl:px-10">
      <LatestBlogs />
      <FeaturedPost />
      <TopArticles />
      <NewsletterCard />
    </div>
  </div>
</HomeLayout>
```

--------------------------------

### Create new Dioxus project

Source: https://daisyui.com/docs/install/dioxus

Creates a new Dioxus project in the current directory. Requires Rust and Dioxus CLI to be installed.

```bash
dx new ./
```

--------------------------------

### Tailwind CSS Example Card Component

Source: https://daisyui.com/pages/install-tailwind-css-vite

An HTML structure for a card component styled using Tailwind CSS utility classes. It includes responsive design and dark mode support.

```html
<div class="max-w-sm rounded-lg bg-white shadow-md transition-colors dark:bg-gray-800">
  <img class="h-auto w-full rounded-t-lg object-cover" src="https://placehold.co/400x200" alt="Card image" />
  <div class="px-4 py-2">
    <h2 class="mb-2 text-xl leading-tight font-semibold tracking-tight 
      text-gray-900 dark:text-white">Tailwind Card</h2>
    <p class="mb-3 leading-relaxed font-normal text-sm text-gray-700 
      dark:text-gray-400">This card uses Tailwind utility classes.</p>
    <div class="flex justify-end">
      <a href="#" class="inline-flex items-center justify-center rounded-lg 
        bg-blue-700 px-4 py-2.5 text-center text-sm font-medium text-white 
        transition-transform duration-200 ease-in-out hover:bg-blue-800 
        focus-visible:ring-4 focus-visible:ring-blue-300 focus-visible:outline-none 
        active:translate-y-0.25 dark:bg-blue-600 dark:hover:bg-blue-700 
        dark:focus-visible:ring-blue-800"> Read more </a>
    </div>
  </div>
</div>
```

--------------------------------

### Install Tailwind CSS and daisyUI with npm

Source: https://daisyui.com/docs/install/dioxus

Initializes a new Node.js project and installs the latest versions of Tailwind CSS CLI and daisyUI. Assumes Node.js is installed.

```bash
npm init -y
npm install tailwindcss@latest @tailwindcss/cli@latest daisyui@latest
```

--------------------------------

### Create Vite Preact Project

Source: https://daisyui.com/docs/install/preact

Initialize a new Preact project using Vite with the preact template. This command sets up the basic project structure and dependencies required for a Preact application.

```bash
npm create vite@latest ./ -- --template preact
```

--------------------------------

### Include Toggle Component CSS from CDN

Source: https://daisyui.com/docs/v5

For projects without a build step, you can include specific daisyUI components via tiny CSS files hosted on a CDN. This example shows how to include only the 'toggle' component's styles.

```html
<link href="https://cdn.jsdelivr.net/npm/daisyui@5/components/toggle.css" rel="stylesheet" type="text/css" />
```

--------------------------------

### Install daisyUI using Package Managers

Source: https://daisyui.com/compare/daisyui-vs-mui

This section provides installation instructions for daisyUI using various package managers, including NPM, PNPM, Yarn, Bun, and Deno. It also shows how to add daisyUI to your main CSS file.

```bash
npm i -D daisyui@latest

```

```bash
pnpm add -D daisyui@latest

```

```bash
yarn add -D daisyui@latest

```

```bash
bun add -D daisyui@latest

```

```bash
deno i -D npm:daisyui@latest

```

```css
@import "tailwindcss";
@plugin "daisyui";

```

--------------------------------

### Install Eleventy, Tailwind CSS, and daisyUI

Source: https://daisyui.com/docs/install/11ty

Installs the required npm packages for an Eleventy project, including Eleventy itself, PostCSS, Tailwind CSS, the Tailwind Typography plugin, and daisyUI. Ensures the latest versions are installed.

```bash
npm install @11ty/eleventy postcss tailwindcss@latest @tailwindcss/postcss@latest @tailwindcss/typography@latest daisyui@latest
```

--------------------------------

### Install daisyUI using NPM

Source: https://daisyui.com/alternative/tailwindui

Installs the latest version of daisyUI as a development dependency using npm.

```bash
npm i -D daisyui@latest
```

--------------------------------

### Apply Dash Style to a Badge

Source: https://daisyui.com/docs/v5

This example demonstrates applying the 'dash' style to a badge component, which adds a dashed border. This style is available for buttons, badges, and alerts.

```html
<div class="badge badge-dash">Dashed Badge</div>
```

--------------------------------

### Configure Context7 MCP Server in VSCode Workspace

Source: https://daisyui.com/docs/editor/vscode

This JSON configuration sets up the 'context7' MCP server for your current VSCode workspace. It defines the server type, the command to execute, and necessary arguments for installing the '@upstash/context7-mcp' package.

```json
{
  "servers": {
    "context7": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@upstash/context7-mcp@latest"
      ]
    }
  }
}
```

--------------------------------

### Install daisyUI using Yarn

Source: https://daisyui.com/alternative/tailwindui

Installs the latest version of daisyUI as a development dependency using yarn.

```bash
yarn add -D daisyui@latest
```

--------------------------------

### Install daisyUI with npm

Source: https://daisyui.com/theme-generator

This snippet shows how to install daisyUI using npm, a popular JavaScript package manager. It includes the command to install the package and the expected output upon successful installation.

```bash
npm i daisyui

installing...

Done!
```

--------------------------------

### Create Astro Project

Source: https://daisyui.com/docs/install/astro

This command initiates the creation of a new Astro project in the current directory.

```bash
npm create astro@latest ./

```

--------------------------------

### React Hero Component Example

Source: https://daisyui.com/components/hero

This example demonstrates the 'Hello there' hero component implemented in React using JSX. It utilizes the same daisyUI classes as the HTML version but adapts the `style` attribute for React's synthetic event system. Ensure React and daisyUI are correctly set up in your project.

```jsx
<div
  className="hero min-h-screen"
  style={{
    backgroundImage:
      "url(https://img.daisyui.com/images/stock/photo-1507358522600-9f71e620c44e.webp)",
  }}
>
  <div className="hero-overlay"></div>
  <div className="hero-content text-neutral-content text-center">
    <div className="max-w-md">
      <h1 className="mb-5 text-5xl font-bold">Hello there</h1>
      <p className="mb-5">
        Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
        quasi. In deleniti eaque aut repudiandae et a id nisi.
      </p>
      <button className="btn btn-primary">Get Started</button>
    </div>
  </div>
</div>
```

--------------------------------

### Project Dependencies for Vite with DaisyUI

Source: https://daisyui.com/stackblitz

This JSON configuration defines the project's name, version, and essential dependencies. It includes Vite for the build tool, DaisyUI and Tailwind CSS for styling, and a Vite plugin for Tailwind CSS. The scripts section outlines commands for development, building, and previewing the application.

```json
{
  "name": "vite-daisyui-5",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "devDependencies": {
    "vite": "6.3.0"
  },
  "dependencies": {
    "@tailwindcss/vite": "4.1.4",
    "daisyui": "5.0.22",
    "tailwindcss": "4.1.4"
  }
}
```

--------------------------------

### Create Vite Project with Lit Template

Source: https://daisyui.com/docs/install/lit

Initializes a new Vite project using the Lit template in the current directory. This command sets up the basic structure for a Lit-based web application.

```bash
npm create vite@latest ./ -- --template lit
```

--------------------------------

### Customize Landing Page with Astro Components

Source: https://daisyui.com/blog/daisyui-astro-tailwind-documentation-template

Configure the landing page layout by modifying the index.astro file. This template imports and displays Hero, Features, CodeBlock, Integration, Contributors, and Testimonial components that can be customized to fit your branding and content requirements.

```astro
---
import CodeBlock from "../components/home/CodeBlock.astro";
import Features from "../components/home/Features.astro";
import Hero from "../components/home/Hero.astro";
import Integration from "../components/home/Integration.astro";
import Contributors from "../components/home/Contributors.astro";
import Testimonial from "../components/home/Testimonial.astro";
---

<script>
  import Translate from "$components/Translate.svelte"
</script>

<div>
  <Hero />
  <Features />
  <CodeBlock />
  <Integration />
  <Contributors />
  <Testimonial />
</div>
```

--------------------------------

### Download daisyUI Bundle (Manual Install)

Source: https://daisyui.com/docs/install/standalone

Commands to download the latest daisyUI bundle files (`daisyui.mjs` and `daisyui-theme.mjs`) for manual integration with Tailwind CSS.

```shell
curl -sLO https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.mjs
curl -sLO https://github.com/saadeghi/daisyui/releases/latest/download/daisyui-theme.mjs
```

--------------------------------

### Quick Use of DaisyUI llms.txt in Cursor

Source: https://daisyui.com/docs/editor/cursor

This prompt allows for quick integration of DaisyUI's documentation into Cursor for immediate code generation assistance. It directly references the online `llms.txt` file.

```markdown
```
@web https://daisyui.com/llms.txt
```
```

--------------------------------

### Install Tailwind CSS, PostCSS, Autoprefixer, and daisyUI

Source: https://daisyui.com/blog/how-to-install-sveltekit-and-daisyui

This command installs the necessary development dependencies for Tailwind CSS and daisyUI. It also generates the `tailwind.config.js` and `postcss.config.js` configuration files.

```bash
npm install -D tailwindcss postcss autoprefixer daisyui
npx tailwindcss init -p
```

--------------------------------

### Create New Rails Project

Source: https://daisyui.com/docs/install/rails

Commands to create a new Ruby on Rails project and navigate into its directory.

```bash
rails new my-app
cd my-app
```

--------------------------------

### Install Headless UI for Vue or React

Source: https://daisyui.com/blog/how-to-use-headless-ui-and-daisyui

Installs the Headless UI library for either Vue or React projects using npm. This is the first step to using its accessible components.

```bash
npm install @headlessui/vue
```

```bash
npm install @headlessui/react
```

--------------------------------

### Quick Setup for daisyUI Docs in VSCode Chat

Source: https://daisyui.com/docs/editor/vscode

This prompt allows you to quickly utilize the daisyUI documentation text file within the VSCode chat interface to generate code. It ensures that the AI has access to the official daisyUI documentation for accurate responses.

```shell
#fetch https://daisyui.com/llms.txt
```

--------------------------------

### Create Django Project and Navigate

Source: https://daisyui.com/docs/install/django

Creates a new Django project named 'myapp' and changes the current directory into the newly created project folder. This sets up the basic structure for a Django application.

```shell
django-admin startproject myapp
cd myapp
```

--------------------------------

### Stack Component for Layered Elements

Source: https://daisyui.com/llms

Component that visually stacks elements on top of each other with optional positioning modifiers (top, bottom, start, end). Supports w-* and h-* utility classes to set uniform sizes for all items.

```html
<div class="stack {MODIFIER}">{CONTENT}</div>
```

--------------------------------

### Previous daisyUI Installation Method (Tailwind CSS 3 and earlier)

Source: https://daisyui.com/docs/v5

Illustrates the older method of installing daisyUI as a plugin in the `tailwind.config.js` file, which was used in Tailwind CSS versions prior to v4.

```javascript
// tailwind.config.{js,ts,mjs,cjs}
module.exports = {
  content: ["./src/**/*.{html,js}"],
  plugins: [
    require('daisyui');
  ],
}

```

--------------------------------

### HTML Button: Beginner and Intermediate daisyUI Usage

Source: https://daisyui.com/pages/best-component-library-for-beginners

Presents two examples of using daisyUI buttons: a basic component usage for beginners and a customized version for intermediate users who combine daisyUI with additional Tailwind CSS classes for finer control.

```html
<!-- Beginner: using components as they come -->
<button class="btn">Button</button>
```

```html
<!-- Intermediate: customizing with additional Tailwind classes -->
<button class="btn rounded-full px-6">Custom Button</button>
```

--------------------------------

### Apply Soft Style to a Button

Source: https://daisyui.com/docs/v5

Components such as 'button', 'badge', and 'alert' now support 'soft' and 'dash' style modifiers. This example shows applying the 'soft' style to a button for a softer appearance.

```html
<button class="btn btn-soft">Soft Button</button>
```

--------------------------------

### CSS Responsive Design for Components

Source: https://daisyui.com/pages/easy-css-library

Illustrates how to implement responsive behavior for UI components, ensuring they adapt to various screen sizes. This involves using media queries to adjust styles at different breakpoints.

```css
/* Each breakpoint needs consideration */
.card {
  width: 100%;
  padding: 1rem;
}

@media (min-width: 640px) {
  .card {
    width: 50%;
    padding: 1.5rem;
  }
}

@media (min-width: 768px) {
  .card {
    width: 33.333%;
    padding: 2rem;
  }
}

@media (min-width: 1024px) {
  .card {
    width: 25%;
  }
}
```

--------------------------------

### Install Rust WebAssembly Target and Trunk

Source: https://daisyui.com/docs/install/yew

Installs the necessary Rust toolchain components, including the WebAssembly target and the Trunk build tool, required for Yew projects.

```bash
rustup target add wasm32-unknown-unknown


```

```bash
cargo install --locked trunk

```

--------------------------------

### HTML Carousel with Half Width Items (DaisyUI)

Source: https://daisyui.com/components/carousel

This example shows a basic carousel implementation using DaisyUI classes in plain HTML. Each carousel item is set to occupy half the width of the carousel container.

```html
<div class="carousel rounded-box w-96">
  <div class="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp" class="w-full" />
  </div>
  <div class="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp" class="w-full" />
  </div>
  <div class="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp" class="w-full" />
  </div>
  <div class="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp" class="w-full" />
  </div>
  <div class="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp" class="w-full" />
  </div>
  <div class="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp" class="w-full" />
  </div>
  <div class="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp" class="w-full" />
  </div>
</div>
```

--------------------------------

### Exclude Specific daisyUI Component in Tailwind CSS

Source: https://daisyui.com/docs/v5

You can also exclude specific components from daisyUI when integrating with Tailwind CSS. This example shows how to exclude the 'scrollbar' component.

```css
@plugin "daisyui" {
  exclude: scrollbar;
}
```

--------------------------------

### Enable Noise Effect using CSS Variable

Source: https://daisyui.com/docs/v5

This example demonstrates enabling the '--noise' effect using a CSS variable, which adds a textured look to components. Effects can be controlled globally or per theme.

```css
:root {
  --noise: 1;
}
```

--------------------------------

### Pikaday Date Picker Integration (Svelte)

Source: https://daisyui.com/components/calendar

This Svelte component example shows how to integrate Pikaday for date selection. It includes instructions for installing Pikaday via npm and uses Svelte's reactive effects to manage the date picker instance.

```svelte
<script>
  import Pikaday from "pikaday";
  let myDatepicker;
  $effect(() => {
    if (myDatepicker) {
      const picker = new Pikaday({
        field: myDatepicker
      });
      return () => picker.destroy();
    }
  });
</script>

<input type="text" class="input pika-single"  bind:this={myDatepicker} value="Pick a day" />
```

--------------------------------

### Add daisyUI Blueprint MCP Server

Source: https://daisyui.com/docs/editor/claudecode

This command adds the daisyUI Blueprint MCP server to Claude Code. It requires environment variables for license, email, and optionally a Figma API key for Figma-to-code conversion. The command installs the daisyui-blueprint package globally.

```bash
claude mcp add daisyui-blueprint \
  --env LICENSE=YOUR_LICENSE_KEY \
  --env EMAIL=YOUR_EMAIL \
  --env FIGMA=YOUR_FIGMA_API_KEY \
  -- npx -y daisyui-blueprint@latest
```

--------------------------------

### Install daisyUI using Bun

Source: https://daisyui.com/compare/daisyui-vs-chakra

Adds the latest version of daisyUI as a development dependency using the Bun runtime and package manager.

```bash
bun add -D npm:daisyui@latest
```

--------------------------------

### Install Tailwind CSS and daisyUI

Source: https://daisyui.com/docs/install/astro

Installs the necessary Tailwind CSS and daisyUI packages using npm.

```bash
npm install tailwindcss@latest @tailwindcss/vite@latest daisyui@latest

```

--------------------------------

### Include Specific daisyUI Component in Tailwind CSS

Source: https://daisyui.com/docs/v5

When using daisyUI with Tailwind CSS, you can configure the plugin to include only specific components. This example demonstrates including only the 'toggle' component.

```css
@plugin "daisyui" {
  include: toggle;
}
```

--------------------------------

### Color Text Examples with daisyUI

Source: https://daisyui.com/docs/layout-and-typography

Shows examples of text styled with various daisyUI color schemes, including primary, secondary, accent, info, success, warning, and error, for visual feedback and theming.

```html
<p class="text-primary">Primary text</p>
<p class="text-secondary">Secondary text</p>
<p class="text-accent">Accent text</p>
<p class="text-info">Info text</p>
<p class="text-success">Success text</p>
<p class="text-warning">Warning text</p>
<p class="text-error">Error text</p>
```

--------------------------------

### Install Angular CLI Globally

Source: https://daisyui.com/docs/install/angular

Installs the Angular Command Line Interface globally on your system, enabling you to create and manage Angular projects. This is a prerequisite for the installation process.

```bash
npm install -g @angular/cli@latest
```

--------------------------------

### Use daisyUI Button in Next.js Page

Source: https://daisyui.com/blog/install-daisyui-and-tailwindcss-in-nextjs

Example of rendering a primary button using daisyUI classes within a Next.js page component. This demonstrates basic integration and usage of daisyUI components.

```typescript
export default function Home() {
  return (
    <>
      <button className="btn btn-primary">Hello daisyUI!</button>
    </>
  )
}

```

--------------------------------

### Create new Vite React project

Source: https://daisyui.com/docs/install/react

Initialize a new React project using Vite in the current directory. This command creates the necessary project structure and configuration files for a modern React development environment.

```bash
npm create vite@latest ./ -- --template react
```

--------------------------------

### Example metadata.json Entry

Source: https://daisyui.com/blog/daisyui-nextjs-online-store-template

Demonstrates the structure for extending product data using a JSON file. This allows for custom categories, variants, images, and detailed product information beyond what the Lemon Squeezy API provides.

```json
{
  "id": "12345",
  "availability": true,
  "sale": true,
  "category": ["trending", "bestsellers"],
  "original_price": "$50",
  "variant": {
    "size": [
      { "name": "Small", "link": "https://example.com/small" },
      { "name": "Medium", "link": "https://example.com/medium" }
    ]
  },
  "info": {
    "Material": "100% Cotton",
    "Care Instructions": "Machine washable"
  },
  "images": ["https://example.com/image1.jpg", "https://example.com/image2.jpg"]
}
```

--------------------------------

### Reference daisyUI llms.txt in Windsurf chat

Source: https://daisyui.com/docs/editor/windsurf

Quick method to reference daisyUI documentation in Windsurf chat for accurate code generation. This approach fetches the compact text version of daisyUI docs from llms.txt file to provide context to the AI model without requiring MCP server setup.

```text
@web https://daisyui.com/llms.txt
```

--------------------------------

### Basic Button Examples with daisyUI

Source: https://daisyui.com/codepen

Demonstrates how to use basic buttons with daisyUI classes for primary, secondary, and accent styles. These examples are standard HTML button elements styled by daisyUI.

```html
<!-- buttons -->
<div class="p-4">
  <button class="btn btn-primary">primary</button>
  <button class="btn btn-secondary">secondary</button>
  <button class="btn btn-accent">accent</button>
</div>
```

--------------------------------

### Configure daisyUI GitMCP Server in Zed

Source: https://daisyui.com/docs/editor/zed

Setup daisyUI GitMCP server in Zed using mcp-remote to connect to the official daisyUI GitHub repository. Enables Agent Mode to query daisyUI documentation and generate components from natural language prompts.

```json
{
 "daisyui-github": {
   "command": "npx",
   "args": ["-y", "mcp-remote", "https://gitmcp.io/saadeghi/daisyui"]
 }
}
```

--------------------------------

### Create New Angular Project

Source: https://daisyui.com/docs/install/angular

Creates a new Angular project named 'my-project' with CSS styling and navigates into the project directory. This sets up the basic structure for your Angular application.

```bash
ng new my-project --style css
cd my-project
```

--------------------------------

### Enable Depth Effect using CSS Variable

Source: https://daisyui.com/docs/v5

daisyUI 5 introduces 'Effect' CSS variables to globally or per-theme enable visual effects. This example shows how to enable the '--depth' effect, adding subtle depth to components.

```css
:root {
  --depth: 1;
}
```

--------------------------------

### DaisyUI Link Component: HTML Example

Source: https://daisyui.com/llms

Shows how to style anchor tags as links using DaisyUI. The base class is 'link'. Additional modifier classes like 'link-hover' and color classes (`link-neutral`, `link-primary`, etc.) can be applied to customize the link's appearance. This component adds an underline style by default.

```html
<a class="link {MODIFIER}">Click me</a>
```

--------------------------------

### Add daisyUI via npm

Source: https://daisyui.com/docs/install/rails

Steps to initialize a package.json and install the latest version of daisyUI using npm, for projects already using Node.js.

```bash
npm init -y
npm install daisyui@latest
```

--------------------------------

### CSS Accessibility Best Practices

Source: https://daisyui.com/pages/easy-css-library

Showcases CSS code examples that incorporate accessibility considerations, such as focus indicators, high contrast mode support, reduced motion preferences, and proper color contrast ratios.

```css
/* Accessibility adds complexity */
.button {
  /* Visual focus indicators */
  outline: none;
}

.button:focus-visible {
  outline: 2px solid #3b82f6;
  outline-offset: 2px;
}

/* High contrast mode support */
@media (prefers-contrast: high) {
  .button {
    border: 2px solid currentColor;
  }
}

/* Reduced motion support */
@media (prefers-reduced-motion: reduce) {
  .button {
    transition: none;
  }
}

/* Proper color contrast ratios */
.text-secondary {
  color: #6b7280; /* Must meet WCAG AA standards */
}
```

--------------------------------

### Download daisyUI Bundle Files

Source: https://daisyui.com/docs/install/yew

Downloads the latest versions of the daisyUI JavaScript module ('daisyui.mjs') and theme file ('daisyui-theme.mjs') from GitHub releases.

```bash
curl -sLO https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.mjs
curl -sLO https://github.com/saadeghi/daisyui/releases/latest/download/daisyui-theme.mjs

```

--------------------------------

### Update Sidebar Navigation Component (Astro)

Source: https://daisyui.com/blog/daisyui-astro-tailwind-documentation-template

This snippet shows the structure of the Astro component responsible for rendering the sidebar navigation. Developers can modify this file to add, remove, or change documentation sections. It includes basic HTML structure for a drawer component.

```astro
<div class="drawer-side z-40 md:border-r md:border-base-content/10">
  <label
    for="my-drawer-2"
    aria-label="close sidebar"
    class="drawer-overlay"
  ></label>
  <aside class="bg-base-100 min-h-screen w-80">
    <div
      class="bg-base-100/90 sticky top-0 z-20 items-center gap-2 px-4 py-2 backdrop-blur lg:flex"
    >
      <a href="/" class="flex-0 btn btn-ghost px-2">
        <h1
          class="text-2xl font-bold bg-clip-text text-transparent bg-linear-to-r from-primary to-primary/50"
        >
          Access Shield{" "}
          <span class="text-sm text-base-content opacity-50">docs</span>
        </h1>
      </a>
    </div>
  </aside>

  <!-- SideBar Code -->
</div>
```

--------------------------------

### DaisyUI List Component: HTML Example

Source: https://daisyui.com/llms

Demonstrates the DaisyUI list component for vertical layouts. Use the 'list' class on a `<ul>` element and 'list-row' on each `<li>`. Modifier classes like 'list-col-wrap' and 'list-col-grow' can be used on list items to control wrapping and space distribution within rows.

```html
<ul class="list">
  <li class="list-row">{CONTENT}</li>
</ul>
```

--------------------------------

### daisyUI Loading Ring Examples (HTML)

Source: https://daisyui.com/components/loading

Provides examples of the loading ring animation using HTML, showcasing its application with various size modifiers. The ring animation is a distinct visual cue for ongoing processes.

```html
<span class="loading loading-ring loading-xs"></span>
<span class="loading loading-ring loading-sm"></span>
<span class="loading loading-ring loading-md"></span>
<span class="loading loading-ring loading-lg"></span>
<span class="loading loading-ring loading-xl"></span>
```

--------------------------------

### Default Button Examples (HTML)

Source: https://daisyui.com/components/button

Demonstrates the basic usage of the daisyUI default button component. This requires no external dependencies beyond the daisyUI CSS framework.

```html
<button class="btn">Default</button>
```

```html
<button class="btn">Default</button>
```

```jsx
<button className="btn">Default</button>
```

```jsx
<button className="btn">Default</button>
```

--------------------------------

### Initialize Deno Fresh Project with Tailwind CSS

Source: https://daisyui.com/docs/install/fresh

Creates a new Deno Fresh project with Tailwind CSS and VS Code integration pre-configured. This command sets up the project structure and dependencies needed for daisyUI integration.

```bash
deno run -Ar jsr:@fresh/init ./ --tailwind --vscode
```

--------------------------------

### React JSX Carousel with Half Width Items (DaisyUI)

Source: https://daisyui.com/components/carousel

This example demonstrates a carousel with half-width items implemented using React JSX and DaisyUI classes. The structure is similar to the HTML version, adapted for React's syntax.

```jsx
<div className="carousel rounded-box w-96">
  <div className="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp" className="w-full" />
  </div>
  <div className="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp" className="w-full" />
  </div>
  <div className="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp" className="w-full" />
  </div>
  <div className="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp" className="w-full" />
  </div>
  <div className="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp" className="w-full" />
  </div>
  <div className="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp" className="w-full" />
  </div>
  <div className="carousel-item w-1/2">
    <img src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp" className="w-full" />
  </div>
</div>
```

--------------------------------

### CSS for Heading and Spacing Styling

Source: https://daisyui.com/pages/easy-css-library

Provides CSS examples for styling headings, including font size, line height, letter spacing, font weight, and bottom margin. This snippet emphasizes the detailed decisions required for typography and spacing to impact user experience and readability.

```css
/* Each decision affects the user experience */
.heading {
  font-size: 1.875rem; /* Why this size? */
  line-height: 2.25rem; /* Why this line height? */
  letter-spacing: -0.025em; /* Why negative spacing? */
  font-weight: 700; /* Why this weight? */
  margin-bottom: 1.5rem; /* Why this spacing? */
}
```

--------------------------------

### DaisyUI Input Field: HTML Example

Source: https://daisyui.com/llms

Shows the basic syntax for creating a text input field using DaisyUI. The core class is 'input', which can be combined with various modifier classes for style (`input-ghost`), color (`input-neutral`, `input-primary`, etc.), and size (`input-xs`, `input-sm`, etc.). The type attribute can be any valid HTML input type.

```html
<input type="{type}" placeholder="Type here" class="input {MODIFIER}" />
```

--------------------------------

### Configure daisyUI Blueprint MCP Server in Zed

Source: https://daisyui.com/docs/editor/zed

Setup the official daisyUI Blueprint MCP server in Zed by adding this configuration to enable Figma-to-code conversion and AI-powered daisyUI component generation. Requires a Blueprint license key and email address; Figma API key is optional.

```json
{
 "daisyui-blueprint": {
   "command": "npx",
   "args": ["-y", "daisyui-blueprint@latest"],
   "env": {
     "LICENSE": "YOUR BLUEPRINT LICENSE KEY",
     "EMAIL": "YOUR EMAIL ADDRESS",
     "FIGMA": "YOUR FIGMA API KEY (optional)"
   }
 }
}
```

--------------------------------

### Framework-Specific Component Library Usage

Source: https://daisyui.com/pages/best-component-library-for-beginners

Example of using a framework-specific UI component library to render a button. While convenient, this approach creates tight coupling to specific frameworks and dependencies, limiting code portability and long-term maintainability.

```JavaScript
import { Button } from "some-ui-library"

return <Button className="btn btn-primary">Click Me</Button>
```

--------------------------------

### Carousel Snap to End - HTML Example

Source: https://daisyui.com/components/carousel

This snippet shows a basic implementation of a carousel that snaps to the end using DaisyUI classes in standard HTML. It requires the DaisyUI and Tailwind CSS libraries to be included in the project. The `carousel-end` class is key to achieving the desired alignment.

```html
<div class="carousel carousel-end rounded-box">
  <div class="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp" alt="Drink" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      alt="Drink" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      alt="Drink" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      alt="Drink" />
  </div>
  <div class="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp" alt="Drink" />
  </div>
  <div class="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp" alt="Drink" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      alt="Drink" />
  </div>
</div>
```

--------------------------------

### Fast Install Tailwind CSS and daisyUI (Windows)

Source: https://daisyui.com/docs/install/django

Installs Tailwind CSS and daisyUI quickly on Windows using PowerShell. It downloads the necessary files and sets up the input.css file within the static CSS directory.

```powershell
cd myapp/static/css && powershell -c "irm daisyui.com/fast.ps1 | iex"
```

--------------------------------

### HTML Hero Component Example

Source: https://daisyui.com/components/hero

This is a basic hero component example using HTML and daisyUI classes. It features a background image, an overlay, and centered text content with a call-to-action button. No external dependencies are required other than the daisyUI CSS framework.

```html
<div class="hero min-h-screen" style="background-image: url(https://img.daisyui.com/images/stock/photo-1507358522600-9f71e620c44e.webp);">
  <div class="hero-overlay"></div>
  <div class="hero-content text-neutral-content text-center">
    <div class="max-w-md">
      <h1 class="mb-5 text-5xl font-bold">Hello there</h1>
      <p class="mb-5">
        Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
        quasi. In deleniti eaque aut repudiandae et a id nisi.
      </p>
      <button class="btn btn-primary">Get Started</button>
    </div>
  </div>
</div>
```

--------------------------------

### Install daisyUI with NPM Package Manager

Source: https://daisyui.com/pages/easy-component-library

Shows the command to install daisyUI as a development dependency in a Tailwind CSS project using NPM. This is the first step in setting up daisyUI in your project.

```bash
npm i -D daisyui
```

--------------------------------

### Download Tailwind CSS Executable (Manual Install)

Source: https://daisyui.com/docs/install/standalone

Commands to download the latest Tailwind CSS standalone executable for various operating systems (Linux, macOS, Windows). This is the first step in the manual installation process.

```shell
# Linux
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64-musl
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64-musl

# MacOS
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-arm64
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-x64

# Windows
curl -sLo tailwindcss.exe https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-windows-x64.exe
```

--------------------------------

### Install PostCSS, Tailwind CSS, and daisyUI (npm)

Source: https://daisyui.com/docs/install/postcss

Installs the required npm packages for PostCSS, PostCSS CLI, Tailwind CSS, the Tailwind CSS PostCSS plugin, and the latest version of daisyUI.

```bash
npm i postcss postcss-cli tailwindcss @tailwindcss/postcss daisyui@latest
```

--------------------------------

### Timeline Component Syntax

Source: https://daisyui.com/llms

Creates a vertical or horizontal timeline layout with start, middle, and end content sections. Supports modifiers for direction, icon positioning, and compact display. The component uses timeline-start, timeline-middle, and timeline-end divs to structure content vertically by default.

```html
<ul class="timeline {MODIFIER}">
  <li>
    <div class="timeline-start">{start}</div>
    <div class="timeline-middle">{icon}</div>
    <div class="timeline-end">{end}</div>
  </li>
</ul>
```

--------------------------------

### Install Tailwind CSS and daisyUI Dependencies

Source: https://daisyui.com/docs/install/elysia

Installs the latest versions of Tailwind CSS, its CLI, and daisyUI using Bun. These are essential for styling with daisyUI.

```bash
bun install tailwindcss@latest @tailwindcss/cli@latest daisyui@latest
```

--------------------------------

### Fast Install Tailwind CSS and daisyUI (Linux/MacOS)

Source: https://daisyui.com/docs/install/yew

A shell script to quickly install the latest versions of Tailwind CSS and daisyUI by downloading standalone executables and creating an 'input.css' file.

```bash
curl -sL daisyui.com/fast | bash

```

--------------------------------

### Install Django Package

Source: https://daisyui.com/docs/install/django

Installs the Django Python package using pip. This is a prerequisite for creating and managing Django projects.

```shell
python -m pip install Django
```

--------------------------------

### DaisyUI Card Component Example

Source: https://daisyui.com/codepen

An example of a card component using DaisyUI, featuring an image, a title, and descriptive text. This snippet illustrates how to structure content within a card for a visually appealing presentation.

```html
<div class="card m-4 w-80 shadow-sm">
  <figure>
    <img src="https://img.daisyui.com/images/blog/daisyui-5.webp" />
  </figure>
  <div class="card-body">
    <h2 class="card-title">DaisyUI 5.0</h2>
    <p>Rerum reiciendis beatae tenetur excepturi aut pariatur est eos. Sit sit necessitatibus.</p>
  </div>
</div>
```

--------------------------------

### DaisyUI Vertical and Horizontal Timeline Example (HTML)

Source: https://daisyui.com/components/timeline

This HTML snippet demonstrates how to create a responsive timeline component using DaisyUI. It supports both vertical and horizontal orientations, adapting to different screen sizes. The structure includes list items for each timeline event, with elements for start, middle, and end points.

```html
<ul className="timeline timeline-vertical lg:timeline-horizontal">
  <li>
    <div className="timeline-start">1984</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">First Macintosh computer</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-start">1998</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iMac</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-start">2001</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iPod</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-start">2007</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iPhone</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-start">2015</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">Apple Watch</div>
  </li>
</ul>
```

--------------------------------

### Fast Install Tailwind CSS and daisyUI (Windows)

Source: https://daisyui.com/docs/install/yew

A PowerShell command to quickly install the latest versions of Tailwind CSS and daisyUI on Windows by downloading executables and creating an 'input.css' file.

```powershell
powershell -c "irm daisyui.com/fast.ps1 | iex"

```

--------------------------------

### Create Vite Project

Source: https://daisyui.com/docs/install/unocss

Initializes a new Vite project using npm. This command creates a fresh project in the current directory with the vanilla template.

```bash
npm create vite@latest ./ -- --template vanilla
```

--------------------------------

### Apply Bold Star Mask to Image

Source: https://daisyui.com/components/mask

This example shows how to apply a bold star (star-2) mask to an image using DaisyUI. The 'mask mask-star-2' class is used, requiring no additional setup. The input is an image source, and the output is an image masked in a bold star shape.

```html
<img class="mask mask-star-2" src="https://img.daisyui.com/images/stock/photo-1567653418876-5bb0e566e1c2.webp" />
```

```jsx
<img className="mask mask-star-2" src="https://img.daisyui.com/images/stock/photo-1567653418876-5bb0e566e1c2.webp" />
```

--------------------------------

### Customize Documentation Header with Navigation and Theme Toggle

Source: https://daisyui.com/blog/daisyui-astro-tailwind-documentation-template

Modify the documentation page header using the DocsHeader.astro component. This header includes a sticky navigation bar with a responsive hamburger menu, social media links (Twitter), and a theme toggle button for light/dark mode switching.

```astro
<header class="sticky top-0 z-30">
  <nav class="navbar bg-base-100/90 shadow-sm backdrop-blur-lg justify-center items-center py-2 md:px-10 px-2 border-b border-base-content/10">
    <div class="navbar-start">
      <label for="my-drawer-2" class="btn btn-square btn-ghost lg:hidden">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          class="inline-block w-5 h-5 stroke-current"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M4 6h16M4 12h16M4 18h16"
          ></path>
        </svg>
      </label>
    </div>

    <div class="navbar-end">
      <a
        class="btn btn-sm btn-ghost"
        href="https://www.x.com"
        aria-label="twitter"
      >
        <svg viewBox="0 0 24 24" aria-hidden="true" class="h-4 w-4">
          <path
            d="M13.3174 10.7749L19.1457 4H17.7646L12.7039 9.88256L8.66193 4H4L10.1122 12.8955L4 20H5.38119L10.7254 13.7878L14.994 20H19.656L13.3171 10.7749H13.3174ZM11.4257 12.9738L10.8064 12.0881L5.87886 5.03974H8.00029L11.9769 10.728L12.5962 11.6137L17.7652 19.0075H15.6438L11.4257 12.9742V12.9738Z"
            fill="currentColor"
          ></path>
        </svg>
      </a>
      <ThemeToggle />
    </div>
  </nav>
</header>
```

--------------------------------

### HTML Card Component using daisyUI

Source: https://daisyui.com/pages/easy-css-library

Illustrates a professional-looking card component built with daisyUI. This example showcases how daisyUI provides pre-designed components with proper typography, spacing, and visual hierarchy, requiring no explicit CSS knowledge.

```html
<!-- Beautiful, functional components immediately -->
<div class="card w-96 bg-base-100 shadow-xl">
  <figure><img src="photo.jpg" alt="Album" /></figure>
  <div class="card-body">
    <h2 class="card-title">Professional Card</h2>
    <p>Perfect typography, spacing, and visual hierarchy without any CSS knowledge.</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Action</button>
    </div>
  </div>
</div>
```

--------------------------------

### Fast Install daisyUI with Tailwind CLI (Linux/macOS)

Source: https://daisyui.com/docs/install/standalone

A quick command to download the latest Tailwind CSS Standalone executable and daisyUI bundle, create an `input.css` file, and generate `output.css` on Linux or macOS.

```shell
curl -sL daisyui.com/fast | bash
```

--------------------------------

### Fast Install daisyUI with Tailwind CLI (Windows)

Source: https://daisyui.com/docs/install/standalone

A PowerShell command to download the latest Tailwind CSS Standalone executable and daisyUI bundle, create an `input.css` file, and generate `output.css` on Windows.

```powershell
powershell -c "irm daisyui.com/fast.ps1 | iex"
```

--------------------------------

### CSS Inconsistent Implementation Examples

Source: https://daisyui.com/pages/easy-css-library

Demonstrates how different developers may implement similar UI components with varying CSS properties, leading to inconsistencies in the user experience. This highlights the need for standardized guidelines.

```css
/* Different developers, different approaches */
.card-one {
  padding: 16px;
  margin: 20px;
  border-radius: 8px;
}

.card-two {
  padding: 1rem;
  margin: 1.25rem;
  border-radius: 0.5rem;
}

.card-three {
  padding: 20px;
  margin: 15px;
  border-radius: 10px;
}
```

--------------------------------

### Serve HTML with Bun

Source: https://daisyui.com/docs/install/bun

Command to start the Bun development server and serve the `index.html` file. This command automatically processes the HTML and CSS with the configured plugins.

```shell
bun index.html
```

--------------------------------

### Install Tailwind CSS and daisyUI for Rsbuild

Source: https://daisyui.com/docs/install/rsbuild

Installs Tailwind CSS, its PostCSS plugin, and daisyUI as project dependencies. Rsbuild includes built-in PostCSS support.

```bash
npm add tailwindcss @tailwindcss/postcss daisyui@latest

```

--------------------------------

### Toast Notification Wrapper

Source: https://daisyui.com/llms

Stacks notification elements positioned at corners or center of the page. Accepts placement modifiers (start, center, end, top, middle, bottom) to control positioning. The component wraps content with positioning classes for flexible notification placement.

```html
<div class="toast {MODIFIER}">{CONTENT}</div>
```

--------------------------------

### Install daisyUI Package

Source: https://daisyui.com/docs/install/reactrouter

Command to install the latest version of daisyUI using npm. This adds the daisyUI library to your project's dependencies.

```bash
npm install daisyui@latest
```

--------------------------------

### Build Feature-Complete Card Component with DaisyUI

Source: https://daisyui.com/pages/easy-css-library

Creates a reusable card component with title, body content, and action buttons using DaisyUI's card system. Demonstrates how DaisyUI reduces development time from hours to minutes. Pre-styled with shadows and responsive sizing for immediate production use.

```HTML
<div class="card w-96 bg-base-100 shadow-xl">
  <div class="card-body">
    <h2 class="card-title">Feature complete!</h2>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Ship it</button>
    </div>
  </div>
</div>
```

--------------------------------

### Install Electron, Tailwind CSS, and daisyUI (Terminal)

Source: https://daisyui.com/docs/install/electron

Installs the core dependencies required for an Electron application with Tailwind CSS and daisyUI integration. This command fetches the latest versions of these packages from npm.

```bash
npm install electron tailwindcss@latest @tailwindcss/cli@latest daisyui@latest
```

--------------------------------

### DaisyUI Label Components: HTML Examples

Source: https://daisyui.com/llms

Illustrates two ways to implement labels with DaisyUI: regular labels within an input group and floating labels. For regular labels, use the 'label' class on a `<span>` inside a container with the 'input' class. For floating labels, use the 'floating-label' class on the parent container, placing the `<span>` after the `<input>` element.

```html
<label class="input">
  <span class="label">{label text}</span>
  <input type="text" placeholder="Type here" />
</label>
```

```html
<label class="floating-label">
  <input type="text" placeholder="Type here" class="input" />
  <span>{label text}</span>
</label>
```

--------------------------------

### Force Open Dropdown Example (HTML & React JSX)

Source: https://daisyui.com/components/dropdown

Demonstrates how to force a DaisyUI dropdown to be open using the 'dropdown-open' class. This is useful for pre-showing dropdown content. The examples are provided in both plain HTML and React JSX.

```html
<div class="dropdown dropdown-open">
  <div tabindex="0" role="button" class="btn m-1">Button</div>
  <ul tabindex="-1" class="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

```jsx
<div className="dropdown dropdown-open">
  <div tabIndex={0} role="button" className="btn m-1">Button</div>
  <ul tabIndex="-1" className="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

--------------------------------

### Install Tailwind CSS and Vite Plugin

Source: https://daisyui.com/pages/install-tailwind-css-vite

Commands to install the latest versions of Tailwind CSS and its Vite plugin. These are necessary dependencies for using Tailwind CSS with Vite.

```bash
npm install tailwindcss@latest @tailwindcss/vite@latest
```

--------------------------------

### Configure Context7 MCP Server in Zed

Source: https://daisyui.com/docs/editor/zed

Setup Context7 MCP server in Zed for AI-powered daisyUI code generation. This lightweight configuration enables Agent Mode to ask questions about daisyUI components and generate code based on natural language prompts.

```json
{
 "context7": {
   "command": "npx",
   "args": ["-y", "@upstash/context7-mcp@latest"]
 }
}
```

--------------------------------

### React Radio Inputs for Joinable Button Groups (DaisyUI)

Source: https://daisyui.com/components/pagination

This example demonstrates creating a group of radio inputs styled as joined buttons within a React component using DaisyUI classes. It utilizes JSX syntax, including 'className' instead of 'class', and the 'checked' attribute for initial selection. Ensure DaisyUI is installed and configured in your React project.

```jsx
<div className="join">
  <input
    className="join-item btn btn-square"
    type="radio"
    name="options"
    aria-label="1"
    checked="checked" />
  <input className="join-item btn btn-square" type="radio" name="options" aria-label="2" />
  <input className="join-item btn btn-square" type="radio" name="options" aria-label="3" />
  <input className="join-item btn btn-square" type="radio" name="options" aria-label="4" />
</div>
```

--------------------------------

### Create Professional Hero Section with DaisyUI

Source: https://daisyui.com/pages/easy-css-library

Builds a centered hero landing page section with headline, description, and call-to-action button. Requires DaisyUI CSS framework and uses Tailwind's utility classes for responsive sizing and typography. Ideal for beginners creating professional layouts without CSS expertise.

```HTML
<div class="hero min-h-screen bg-base-200">
  <div class="hero-content text-center">
    <div class="max-w-md">
      <h1 class="text-5xl font-bold">Hello there</h1>
      <p class="py-6">Professional-looking websites without learning CSS first.</p>
      <button class="btn btn-primary">Get Started</button>
    </div>
  </div>
</div>
```

--------------------------------

### DaisyUI Join Component: HTML Example

Source: https://daisyui.com/llms

Demonstrates the DaisyUI join component for grouping elements like buttons or inputs. Use the 'join' class on the container and 'join-item' on child elements. The 'join-vertical' or 'join-horizontal' modifier can control the layout direction. This component applies border radius to the first and last items in the group.

```html
<div class="join {MODIFIER}">{CONTENT}</div>
```

--------------------------------

### DaisyUI Tabs Component Examples (HTML)

Source: https://daisyui.com/components/tab

Demonstrates the creation of DaisyUI tabs with different size variations (xs, sm, md, lg, xl) using HTML structure. Each example shows a basic tab list with active and inactive tab elements.

```html
<div role="tablist" class="tabs tabs-lift tabs-xs">
  <a role="tab" class="tab">Xsmall</a>
  <a role="tab" class="tab tab-active">Xsmall</a>
  <a role="tab" class="tab">Xsmall</a>
</div>

<div role="tablist" class="tabs tabs-lift tabs-sm">
  <a role="tab" class="tab">Small</a>
  <a role="tab" class="tab tab-active">Small</a>
  <a role="tab" class="tab">Small</a>
</div>

<div role="tablist" class="tabs tabs-lift">
  <a role="tab" class="tab">Medium</a>
  <a role="tab" class="tab tab-active">Medium</a>
  <a role="tab" class="tab">Medium</a>
</div>

<div role="tablist" class="tabs tabs-lift tabs-lg">
  <a role="tab" class="tab">Large</a>
  <a role="tab" class="tab tab-active">Large</a>
  <a role="tab" class="tab">Large</a>
</div>

<div role="tablist" class="tabs tabs-lift tabs-xl">
  <a role="tab" class="tab">Xlarge</a>
  <a role="tab" class="tab tab-active">Xlarge</a>
  <a role="tab" class="tab">Xlarge</a>
</div>
```

--------------------------------

### DaisyUI Tooltip Placement Examples

Source: https://daisyui.com/components/tooltip

Demonstrates the different placement options for DaisyUI tooltips: top, bottom, left, and right. These are controlled by adding corresponding classes (`tooltip-top`, `tooltip-bottom`, `tooltip-left`, `tooltip-right`) to the tooltip container. These examples also show the `tooltip-open` modifier for consistent visibility.

```html
<div class="tooltip tooltip-open tooltip-top" data-tip="hello">
  <button class="btn">Top</button>
</div>
```

```html
<div class="tooltip tooltip-open tooltip-bottom" data-tip="hello">
  <button class="btn">Bottom</button>
</div>
```

```html
<div class="tooltip tooltip-open tooltip-left" data-tip="hello">
  <button class="btn">Left</button>
</div>
```

```html
<div className="tooltip tooltip-open tooltip-top" data-tip="hello">
  <button className="btn">Top</button>
</div>
```

```html
<div className="tooltip tooltip-open tooltip-bottom" data-tip="hello">
  <button className="btn">Bottom</button>
</div>
```

```html
<div className="tooltip tooltip-open tooltip-left" data-tip="hello">
  <button className="btn">Left</button>
</div>
```

--------------------------------

### Install Tailwind CSS and daisyUI Packages

Source: https://daisyui.com/docs/install/nextjs

Installs Tailwind CSS, its PostCSS plugin, and the latest version of daisyUI. These are essential dependencies for using daisyUI in a Next.js project.

```bash
npm install tailwindcss @tailwindcss/postcss daisyui@latest
```

--------------------------------

### Vertical Timeline with DaisyUI

Source: https://daisyui.com/components/timeline

This HTML snippet shows how to create a vertical timeline using DaisyUI's timeline component. It includes styling for the timeline itself, the start and end points of each item, and the connecting lines. The example uses SVG icons for timeline markers and applies primary color to the lines.

```html
<ul class="timeline timeline-vertical">
  <li>
    <div class="timeline-start timeline-box">First Macintosh computer</div>
    <div class="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="text-primary h-5 w-5"
      >
        <path
          fill-rule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clip-rule="evenodd"
        />
      </svg>
    </div>
    <hr class="bg-primary" />
  </li>
  <li>
    <hr class="bg-primary" />
    <div class="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="text-primary h-5 w-5"
      >
        <path
          fill-rule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clip-rule="evenodd"
        />
      </svg>
    </div>
    <div class="timeline-end timeline-box">iMac</div>
    <hr class="bg-primary" />
  </li>
  <li>
    <hr class="bg-primary" />
    <div class="timeline-start timeline-box">iPod</div>
    <div class="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="text-primary h-5 w-5"
      >
        <path
          fill-rule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clip-rule="evenodd"
        />
      </svg>
    </div>
    <hr />
  </li>
  <li>
    <hr />
    <div class="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="h-5 w-5"
      >
        <path
          fill-rule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clip-rule="evenodd"
        />
      </svg>
    </div>
    <div class="timeline-end timeline-box">iPhone</div>
    <hr />
  </li>
  <li>
    <hr />
    <div class="timeline-start timeline-box">Apple Watch</div>
    <div class="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="h-5 w-5"
      >
        <path
          fill-rule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clip-rule="evenodd"
        />
      </svg>
    </div>
  </li>
</ul>
```

--------------------------------

### DaisyUI Hero Component Example (HTML)

Source: https://daisyui.com/components/hero

An example of a centered Hero component using DaisyUI classes. It displays a title, description, and a call-to-action button. This component is typically used for landing pages or promotional sections.

```html
<div class="hero bg-base-200 min-h-screen">
  <div class="hero-content text-center">
    <div class="max-w-md">
      <h1 class="text-5xl font-bold">Hello there</h1>
      <p class="py-6">
        Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
        quasi. In deleniti eaque aut repudiandae et a id nisi.
      </p>
      <button class="btn btn-primary">Get Started</button>
    </div>
  </div>
</div>
```

--------------------------------

### Download Tailwind CSS Executables

Source: https://daisyui.com/docs/install/yew

Commands to download the Tailwind CSS executable for various operating systems (Linux, MacOS, Windows) from GitHub releases.

```bash
# Run the corresponding command for your OS

# Linux
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64-musl
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64-musl

# MacOS
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-arm64
curl -sLo tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-x64

# Windows
curl -sLo tailwindcss.exe https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-windows-x64.exe

```

--------------------------------

### Configure Trunk.toml for Build Hook

Source: https://daisyui.com/docs/install/yew

Defines the build settings for Trunk, specifying the main HTML target, output directory, and a build hook to automatically compile CSS using Tailwind.

```toml
[build]
target = "index.html"
dist = "dist"

[[hooks]]
stage = "build"
command = "sh"
command_arguments = ["-c", "./tailwindcss -i input.css -o $TRUNK_STAGING_DIR/output.css"]

```

--------------------------------

### daisyUI 5 Dependency Comparison - Before and After

Source: https://daisyui.com/docs/v5

Comparison of daisyUI dependency tree before version 5 (1.8 MB, 250 files, 7 dependencies including culori, picocolors, postcss-js) versus after version 5 (0 KB, zero dependencies). Demonstrates significant reduction in package footprint and maintenance complexity.

```text
Before
Dependencies - Total 1.8 MB on disk (250 files)
  ├╴ culori
  ├╴ picocolors
  ├╴ postcss-js
  │  ╰╴ camelcase-css
  ╰╴ css-selector-tokenizer
     ├╴ cssesc
     ╰╴ fastparse

After
No dependencies - 0 kB
```

--------------------------------

### DaisyUI Indicator: HTML Example

Source: https://daisyui.com/llms

Illustrates how to use the DaisyUI indicator component to overlay elements. The structure involves a parent `<div>` with the 'indicator' class, containing a `<span>` with the 'indicator-item' class for the overlaid content, followed by the main content `<div>`. Placement classes like `indicator-start`, `indicator-center`, `indicator-end`, `indicator-top`, `indicator-middle`, `indicator-bottom` can be used to position the indicator item.

```html
<div class="indicator">
  <span class="indicator-item">{indicator content}</span>
  <div>{main content}</div>
</div>
```

--------------------------------

### Install Tailwind CSS and daisyUI for Bun

Source: https://daisyui.com/docs/install/bun

Installs the necessary packages, `bun-plugin-tailwind`, `tailwindcss`, and `daisyui`, using the Bun package manager. These are required for Tailwind CSS and daisyUI integration.

```shell
bun install bun-plugin-tailwind tailwindcss@latest daisyui@latest
```

--------------------------------

### Yew App HTML Structure

Source: https://daisyui.com/docs/install/yew

Defines the basic HTML structure for a Yew application, including the character set, title, and a link to the 'output.css' stylesheet.

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Yew App</title>
    <link rel="stylesheet" href="output.css" />
  </head>
  <body></body>
</html>

```

--------------------------------

### Initialize Bun Project

Source: https://daisyui.com/docs/install/bun

Initializes a new Bun project in the current directory. This is the first step to setting up the development environment.

```shell
bun init -y
```

--------------------------------

### DaisyUI Hero Component Example (React)

Source: https://daisyui.com/components/hero

A React implementation of the DaisyUI Hero component. This example demonstrates how to use the Hero component within a React application, maintaining the same structure and functionality as the HTML version.

```jsx
<div className="hero bg-base-200 min-h-screen">
  <div className="hero-content text-center">
    <div className="max-w-md">
      <h1 className="text-5xl font-bold">Hello there</h1>
      <p className="py-6">
        Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem
        quasi. In deleniti eaque aut repudiandae et a id nisi.
      </p>
      <button className="btn btn-primary">Get Started</button>
    </div>
  </div>
</div>
```

--------------------------------

### Install Tailwind CSS for Rails

Source: https://daisyui.com/docs/install/rails

Commands to add the tailwindcss-rails gem and install Tailwind CSS into a Rails project.

```bash
./bin/bundle add tailwindcss-rails
./bin/rails tailwindcss:install
```

--------------------------------

### Card as Dropdown Example (HTML & React JSX)

Source: https://daisyui.com/components/dropdown

Shows how to use a DaisyUI card component as the content for a dropdown. This allows for richer, more complex content within the dropdown. The examples are provided in HTML and React JSX.

```html
<div class="dropdown">
  <div tabindex="0" role="button" class="btn m-1">Click</div>
  <div
    tabindex="0"
    class="dropdown-content card card-sm bg-base-100 z-1 w-64 shadow-md">
    <div class="card-body">
      <p>This is a card. You can use any element as a dropdown.</p>
    </div>
  </div>
</div>
```

```jsx
<div className="dropdown">
  <div tabIndex={0} role="button" className="btn m-1">Click</div>
  <div
    tabIndex={0}
    className="dropdown-content card card-sm bg-base-100 z-1 w-64 shadow-md">
    <div className="card-body">
      <p>This is a card. You can use any element as a dropdown.</p>
    </div>
  </div>
</div>
```

--------------------------------

### Window Mockup with DaisyUI

Source: https://daisyui.com/llms

Creates a box that mimics an operating system window. Used for framing content within a typical window UI.

```html
<div class="mockup-window border bg-base-300">
  <div class="flex flex-col gap-3 p-4">
    <div>Window Content</div>
    <button class="btn btn-primary">Click Me</button>
  </div>
</div>
```

--------------------------------

### Import daisyUI CSS

Source: https://daisyui.com/blog/npm-init-daisyui

Demonstrates how to import the generated CSS file into your project. This is necessary if you are not using a bundler that handles CSS imports automatically.

```javascript
import "/output.css"
```

--------------------------------

### Basic Yew App Component

Source: https://daisyui.com/docs/install/yew

A simple Yew functional component that renders an HTML button with the text 'Hello daisyUI' and applies a CSS class for styling.

```rust
use yew::prelude::*;

#[function_component]
fn App() -> Html {
    html! {
        <button class="btn">{ "Hello daisyUI" }</button>
    }
}

fn main() {
    yew::Renderer::<App>::new().render();
}

```

--------------------------------

### DaisyUI Custom Theme with Custom Colors (CSS)

Source: https://daisyui.com/llms

Defines a custom DaisyUI theme by importing Tailwind CSS and daisyUI plugins, and then configuring theme properties like colors and border radii using CSS variables. This example uses OKLCH color format but supports hex or other formats. Ensure all required CSS variables are present when creating a custom theme.

```css
@import "tailwindcss";
@plugin "daisyui";
@plugin "daisyui/theme" {
  name: "mytheme";
  default: true; /* set as default */
  prefersdark: false; /* set as default dark mode (prefers-color-scheme:dark) */
  color-scheme: light; /* color of browser-provided UI */

  --color-base-100: oklch(98% 0.02 240);
  --color-base-200: oklch(95% 0.03 240);
  --color-base-300: oklch(92% 0.04 240);
  --color-base-content: oklch(20% 0.05 240);
  --color-primary: oklch(55% 0.3 240);
  --color-primary-content: oklch(98% 0.01 240);
  --color-secondary: oklch(70% 0.25 200);
  --color-secondary-content: oklch(98% 0.01 200);
  --color-accent: oklch(65% 0.25 160);
  --color-accent-content: oklch(98% 0.01 160);
  --color-neutral: oklch(50% 0.05 240);
  --color-neutral-content: oklch(98% 0.01 240);
  --color-info: oklch(70% 0.2 220);
  --color-info-content: oklch(98% 0.01 220);
  --color-success: oklch(65% 0.25 140);
  --color-success-content: oklch(98% 0.01 140);
  --color-warning: oklch(80% 0.25 80);
  --color-warning-content: oklch(20% 0.05 80);
  --color-error: oklch(65% 0.3 30);
  --color-error-content: oklch(98% 0.01 30);

  --radius-selector: 1rem; /* border radius of selectors (checkbox, toggle, badge) */
  --radius-field: 0.25rem; /* border radius of fields (button, input, select, tab) */
  --radius-box: 0.5rem; /* border radius of boxes (card, modal, alert) */
  /* preferred values for --radius-* : 0rem, 0.25rem, 0.5rem, 1rem, 2rem */

  --size-selector: 0.25rem; /* base size of selectors (checkbox, toggle, badge). Value must be 0.25rem unless we intentionally want bigger selectors. In so it can be 0.28125 or 0.3125. If we intentionally want smaller selectors, it can be 0.21875 or 0.1875 */
  --size-field: 0.25rem; /* base size of fields (button, input, select, tab). Value must be 0.25rem unless we intentionally want bigger fields. In so it can be 0.28125 or 0.3125. If we intentionally want smaller fields, it can be 0.21875 or 0.1875 */

  --border: 1px; /* border size. Value must be 1px unless we intentionally want thicker borders. In so it can be 1.5px or 2px. If we intentionally want thinner borders, it can be 0.5px */

  --depth: 1; /* only 0 or 1 – Adds a shadow and subtle 3D depth effect to components */
  --noise: 0; /* only 0 or 1 - Adds a subtle noise (grain) effect to components */
}

```

--------------------------------

### Dropdown Component Syntax and Usage (HTML)

Source: https://daisyui.com/llms

Illustrates different methods for implementing DaisyUI dropdowns, including using the HTML `<details>` and `<summary>` elements, the Popover API, and CSS focus with `tabindex`. It outlines class names for styling and placement.

```html
<details class="dropdown">
  <summary>Button</summary>
  <ul class="dropdown-content">{CONTENT}</ul>
</details>
```

```html
<button popovertarget="{id}" style="anchor-name:--{anchor}">{button}</button>
<ul class="dropdown-content" popover id="{id}" style="position-anchor:--{anchor}">{CONTENT}</ul>
```

```html
<div class="dropdown">
  <div tabindex="0" role="button">Button</div>
  <ul tabindex="-1" class="dropdown-content">{CONTENT}</ul>
</div>
```

--------------------------------

### Install daisyUI npm Package

Source: https://daisyui.com/blog/9-best-tailwind-css-plugins-for-developers

Install the daisyUI component library for Tailwind CSS using npm package manager. This command downloads the daisyUI package and its dependencies to your project's node_modules directory.

```bash
npm i daisyui
```

--------------------------------

### Install Tailwind CSS and daisyUI for Ember

Source: https://daisyui.com/docs/install/ember

Installs the necessary packages for Tailwind CSS and daisyUI into an Ember project using npm. This includes the latest versions of tailwindcss, @tailwindcss/vite, and daisyui, preparing the project for styling integration.

```bash
npm install tailwindcss@latest @tailwindcss/vite@latest daisyui@latest
```

--------------------------------

### HTML, React, Vue, Svelte, Angular Button Examples using daisyUI

Source: https://daisyui.com/pages/easy-css-library

Demonstrates the framework-agnostic nature of daisyUI. This snippet shows the same button component implemented in plain HTML, React, Vue, Svelte, and Angular, highlighting daisyUI's compatibility across various frontend technologies without additional dependencies.

```html
<!-- Plain HTML -->
<button class="btn btn-primary">Click Me</button>

<!-- React -->
<button className="btn btn-primary">Click Me</button>

<!-- Vue -->
<button class="btn btn-primary">Click Me</button>

<!-- Svelte -->
<button class="btn btn-primary">Click Me</button>

<!-- Angular -->
<button class="btn btn-primary">Click Me</button>
```

--------------------------------

### Create React Router Project

Source: https://daisyui.com/docs/install/reactrouter

Command to create a new React Router project in the current directory. This sets up the basic structure for a React application with routing capabilities.

```bash
npm create react-router@latest ./
```

--------------------------------

### Install Tailwind CSS and daisyUI Dependencies

Source: https://daisyui.com/docs/install/angular

Installs the latest versions of daisyUI, Tailwind CSS, Tailwind CSS PostCSS plugin, and PostCSS. The `--force` flag may be used to resolve potential peer dependency conflicts.

```bash
npm install daisyui@latest tailwindcss@latest @tailwindcss/postcss@latest postcss@latest --force
```

--------------------------------

### Configure Context7 MCP server in Windsurf

Source: https://daisyui.com/docs/editor/windsurf

Setup Context7 as an alternative MCP server for daisyUI integration in Windsurf. Provides context-aware AI code generation without requiring additional credentials, using Upstash's Context7 MCP package.

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

--------------------------------

### Create Vite Vue Project

Source: https://daisyui.com/docs/install/vue

Command to create a new Vite Vue project in the current directory. This sets up the basic structure for a Vue.js application using Vite as the build tool.

```bash
npm create vite@latest ./ -- --template vue
```

--------------------------------

### Carousel Snap to End - JSX Example

Source: https://daisyui.com/components/carousel

This snippet demonstrates how to create a carousel that snaps to the end using DaisyUI classes within a JSX environment, commonly found in React applications. It requires DaisyUI and Tailwind CSS. The `carousel-end` class ensures the carousel items align to the right side.

```jsx
<div className="carousel carousel-end rounded-box">
  <div className="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp" alt="Drink" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      alt="Drink" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      alt="Drink" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      alt="Drink" />
  </div>
  <div className="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp" alt="Drink" />
  </div>
  <div className="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp" alt="Drink" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      alt="Drink" />
  </div>
</div>
```

--------------------------------

### Link daisyUI CSS in HTML

Source: https://daisyui.com/blog/npm-init-daisyui

Shows how to include the daisyUI CSS file directly in your HTML, typically used in static site generation or when not utilizing a module bundler.

```html
<link href="/output.css" rel="stylesheet" />
```

--------------------------------

### Phone Mockup with DaisyUI

Source: https://daisyui.com/llms

Shows a mockup of an iPhone, including a camera element and a display area for content. Useful for showcasing mobile applications.

```html
<div class="mockup-phone">
  <div class="mockup-phone-camera"></div>
  <div class="mockup-phone-display">
    Content goes here
  </div>
</div>
```

--------------------------------

### Preview Production Build (npm)

Source: https://daisyui.com/blog/nexus-dashboard-template

Starts a local server to preview the production build of the project. Useful for testing the deployed version before actual release.

```bash
npm run preview
```

--------------------------------

### Create Ember Project with Vite

Source: https://daisyui.com/docs/install/ember

Initializes a new Ember project using the latest ember-cli version with the @ember/app-blueprint, leveraging Vite for build tooling. This command sets up the basic structure for a modern Ember application.

```bash
npx ember-cli@latest init --blueprint @ember/app-blueprint
```

--------------------------------

### Code Mockup with DaisyUI

Source: https://daisyui.com/llms

Displays code blocks within a box that looks like a code editor. Supports line prefixes and can be used with syntax highlighting libraries.

```html
<div class="mockup-code">
  <pre data-prefix="1"><code>import React from 'react'
</code></pre>
  <pre data-prefix="2" className="text-warning"><code>// Warning: Something is not right
</code></pre>
  <pre data-prefix="3"><code>console.log('Hello world!')
</code></pre>
</div>
```

--------------------------------

### Build CSS with Tailwind CLI

Source: https://daisyui.com/blog/npm-init-daisyui

A command-line instruction to process your main CSS file (e.g., `tailwind.css`) and output the compiled CSS (e.g., `output.css`) using the Tailwind CSS CLI. This is useful for projects without a bundler.

```bash
npx tailwindcss -i tailwind.css -o output.css
```

--------------------------------

### Install Tailwind CSS CLI and daisyUI

Source: https://daisyui.com/docs/install/htmx

Installs the latest versions of Tailwind CSS CLI, @tailwindcss/cli, and daisyUI using npm. This is a prerequisite for using daisyUI with Tailwind CSS.

```bash
npm install tailwindcss@latest @tailwindcss/cli@latest daisyui@latest
```

--------------------------------

### Theme Switching with daisyUI

Source: https://daisyui.com/pages/ui-library-for-hackaton

This example shows how to switch between different themes for an entire application using a single attribute change on the `<html>` tag. It supports numerous professional themes, allowing for instant visual style changes.

```html
<!-- Light theme -->
<html data-theme="light">

<!-- Dark theme -->
<html data-theme="dark">

<!-- Cyberpunk theme for that extra wow factor -->
<html data-theme="cyberpunk">
```

--------------------------------

### Run Laravel Project with Artisan and Vite

Source: https://daisyui.com/docs/install/laravel

Commands to serve the Laravel project using Artisan and simultaneously run the Vite development server to compile frontend assets.

```shell
php artisan serve
npm run dev
```

--------------------------------

### Pagination Component Syntax

Source: https://daisyui.com/llms

Illustrates the structure for a DaisyUI pagination component using the 'join' class. Each item within the pagination should use the 'join-item' class.

```html
<div class="join">{CONTENT}</div>
```

--------------------------------

### Configure daisyUI GitMCP Server in Claude Desktop

Source: https://daisyui.com/docs/editor/claude

This configuration sets up the daisyUI GitMCP server by specifying the npx command and arguments to run 'mcp-remote' with the daisyUI GitMCP repository URL. This allows direct generation of daisyUI code without needing to specify the server in the prompt.

```json
{
  "mcpServers": {
    "daisyui-github": {
      "command": "npx",
      "args": ["-y", "mcp-remote", "https://gitmcp.io/saadeghi/daisyui"]
    }
  }
}
```

--------------------------------

### Eleventy Layout Template

Source: https://daisyui.com/docs/install/11ty

A default layout template for Eleventy using Nunjucks syntax. It includes basic HTML structure, head meta tags, and links to the main CSS file, applying the 'prose' class for typography.

```html
---
title: My Blog
---

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }}</title>
    <link rel="stylesheet" href="/styles/index.css">
  </head>
  <body class="prose">
    {{ content | safe }}
  </body>
</html>
```

--------------------------------

### DaisyUI Dropdown Component Example

Source: https://daisyui.com/codepen

Shows a basic implementation of a dropdown menu using DaisyUI's `<details>` element. It includes a summary button to toggle the dropdown and a list of items within the dropdown content.

```html
<details class="dropdown m-4">
  <summary class="btn m-1">open/close dropdown</summary>
  <ul class="dropdown-content menu z-[2] w-52 rounded-box bg-base-200 p-2">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</details>
```

--------------------------------

### Basic DaisyUI Menu Example (HTML)

Source: https://daisyui.com/components/menu

A fundamental example of a DaisyUI menu using an unordered list with 'menu' class. This creates a simple, vertically oriented menu. It uses 'bg-base-200' for background and 'rounded-box' for rounded corners.

```html
<ul class="menu bg-base-200 rounded-box w-56">
  <li><a>Item 1</a></li>
  <li><a>Item 2</a></li>
  <li><a>Item 3</a></li>
</ul>
```

--------------------------------

### DaisyUI FAB Component Syntax and Examples

Source: https://daisyui.com/llms

The Floating Action Button (FAB) component in DaisyUI allows for a button that stays in the bottom corner of the screen, revealing additional action buttons when clicked. It supports vertical or quarter-circle arrangements, labels, tooltips, and integration with close or main action buttons. The structure involves a main container with the 'fab' class and nested buttons for actions.

```html
<div class="fab">
  <button class="btn btn-lg btn-circle">{IconOriginal}</button>
</div>
```

```html
<div class="fab">
  <div tabindex="0" role="button" class="btn btn-lg btn-circle btn-primary">{IconOriginal}</div>
  <button class="btn btn-lg btn-circle">{Icon1}</button>
  <button class="btn btn-lg btn-circle">{Icon2}</button>
  <button class="btn btn-lg btn-circle">{Icon3}</button>
</div>
```

```html
<div class="fab">
  <div tabindex="0" role="button" class="btn btn-lg btn-circle btn-primary">{IconOriginal}</div>
  <div>{Label1}<button class="btn btn-lg btn-circle">{Icon1}</button></div>
  <div>{Label2}<button class="btn btn-lg btn-circle">{Icon2}</button></div>
  <div>{Label3}<button class="btn btn-lg btn-circle">{Icon3}</button></div>
</div>
```

```html
<div class="fab">
  <div tabindex="0" role="button" class="btn btn-lg btn-circle btn-primary">{IconOriginal}</div>
  <button class="btn btn-lg">{Label1}</button>
  <button class="btn btn-lg">{Label2}</button>
  <button class="btn btn-lg">{Label3}</button>
</div>
```

```html
<div class="fab">
  <div tabindex="0" role="button" class="btn btn-lg btn-circle btn-primary">{IconOriginal}</div>
  <div class="fab-close">Close <span class="btn btn-circle btn-lg btn-error">✕</span></div>
  <div>{Label1}<button class="btn btn-lg btn-circle">{Icon1}</button></div>
  <div>{Label2}<button class="btn btn-lg btn-circle">{Icon2}</button></div>
  <div>{Label3}<button class="btn btn-lg btn-circle">{Icon3}</button></div>
</div>
```

```html
<div class="fab">
  <div tabindex="0" role="button" class="btn btn-lg btn-circle btn-primary">{IconOriginal}</div>
  <div class="fab-main-action">
    {LabelMainAction}<button class="btn btn-circle btn-secondary btn-lg">{IconMainAction}</button>
  </div>
  <div>{Label1}<button class="btn btn-lg btn-circle">{Icon1}</button></div>
  <div>{Label2}<button class="btn btn-lg btn-circle">{Icon2}</button></div>
  <div>{Label3}<button class="btn btn-lg btn-circle">{Icon3}</button></div>
</div>
```

```html
<div class="fab fab-flower">
  <div tabindex="0" role="button" class="btn btn-lg btn-circle btn-primary">{IconOriginal}</div>
  <button class="fab-main-action btn btn-circle btn-lg">{IconMainAction}</button>
  <button class="btn btn-lg btn-circle">{Icon1}</button>
  <button class="btn btn-lg btn-circle">{Icon2}</button>
  <button class="btn btn-lg btn-circle">{Icon3}</button>
</div>
```

```html
<div class="fab fab-flower">
  <div tabindex="0" role="button" class="btn btn-lg btn-circle btn-primary">{IconOriginal}</div>
  <button class="fab-main-action btn btn-circle btn-lg">{IconMainAction}</button>
  <div class="tooltip tooltip-left" data-tip="{Label1}">
    <button class="btn btn-lg btn-circle">{Icon1}</button>
  </div>
  <div class="tooltip tooltip-left" data-tip="{Label2}">
    <button class="btn btn-lg btn-circle">{Icon2}</button>
  </div>
  <div class="tooltip tooltip-left" data-tip="{Label3}">
    <button class="btn btn-lg btn-circle">{Icon3}</button>
  </div>
</div>
```

--------------------------------

### Configure input.css for Tailwind CSS and daisyUI

Source: https://daisyui.com/docs/install/yew

Sets up the 'input.css' file to import Tailwind CSS, specify source files for processing, and include daisyUI plugins for theming.

```css
@import "tailwindcss";

@source not "./tailwindcss";
@source not "./daisyui{,*}.mjs";

@plugin "./daisyui.mjs";

/* Optional for custom themes – Docs: https://daisyui.com/docs/themes/#how-to-add-a-new-custom-theme */
@plugin "./daisyui-theme.mjs"{ 
  /* custom theme here */ 
}

```

--------------------------------

### Themed Button Examples with daisyUI

Source: https://daisyui.com/codepen

Shows how to apply a specific daisyUI theme (e.g., 'abyss') to buttons using the `data-theme` attribute. This allows for easy theme switching on specific sections or the entire page.

```html
<!-- same buttons with another theme! -->
<div class="p-4" data-theme="abyss">
  <button class="btn btn-primary">Primary</button>
  <button class="btn btn-secondary">Secondary</button>
  <button class="btn btn-accent">Accent</button>
</div>
```

--------------------------------

### Download Tailwind CSS Executable (Linux)

Source: https://daisyui.com/docs/install/django

Downloads the Tailwind CSS standalone executable for various Linux architectures. These commands fetch the necessary binary to the static CSS directory.

```shell
# Run the corresponding command for your OS

# Linux
curl -sLo myapp/static/css/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64
curl -sLo myapp/static/css/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64-musl
curl -sLo myapp/static/css/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
curl -sLo myapp/static/css/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64-musl
```

--------------------------------

### Create Image Carousel with DaisyUI - HTML

Source: https://daisyui.com/components/carousel

Implements a responsive image carousel using DaisyUI's carousel component with rounded styling. The carousel automatically snaps items to the start position and displays multiple food photography items. Use the carousel-item class for each slide.

```html
<div class="carousel rounded-box">
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp"
      alt="Burger" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      alt="Burger" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      alt="Burger" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      alt="Burger" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp"
      alt="Burger" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp"
      alt="Burger" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      alt="Burger" />
  </div>
</div>
```

--------------------------------

### Indicator Start Position with DaisyUI

Source: https://daisyui.com/components/indicator

Demonstrates how to position an indicator at the start of an element using DaisyUI classes. This requires the 'indicator-item' and 'indicator-start' classes on the indicator element.

```html
<div class="indicator">
  <span class="indicator-item indicator-start badge badge-secondary"></span>
  <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

```jsx
<div className="indicator">
  <span className="indicator-item indicator-start badge badge-secondary"></span>
  <div className="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

--------------------------------

### DaisyUI Modal Component Example

Source: https://daisyui.com/codepen

A functional example of a modal dialog implemented with DaisyUI. It includes a button to trigger the modal and the modal structure itself with a form and a close button. The modal is controlled via JavaScript's `showModal()` method.

```html
<!-- Open the modal using ID.showModal() method -->
<button class="btn" onclick="my_modal_1.showModal()">open modal</button>
<dialog id="my_modal_1" class="modal">
  <form method="dialog" class="modal-box">
    <p class="py-4">Press ESC key or click the button below to close</p>
    <div class="modal-action">
      <button class="btn">Close</button>
    </div>
  </form>
</dialog>
```

--------------------------------

### Rails Controller for Homepage

Source: https://daisyui.com/docs/install/rails

A simple Rails controller action to render the homepage.

```ruby
class PagesController < ApplicationController
  def home
  end
end
```

--------------------------------

### Installing Mary UI on an Existing Laravel Project

Source: https://daisyui.com/blog/mary-ui

Outlines the steps to install Mary UI on an existing Laravel project, including adding Tailwind CSS and daisyUI dependencies, initializing Tailwind CSS configuration, modifying `tailwind.config.js`, updating the main CSS file with Tailwind directives, setting up Livewire's default app template, and adding Vite assets.

```bash
composer require robsontenorio/mary
yarn add -D tailwindcss daisyui@latest postcss autoprefixer && npx tailwindcss init -p
php artisan livewire:layout
yarn dev
```

--------------------------------

### Secondary Color Link with DaisyUI

Source: https://daisyui.com/components/link

This example shows how to style a link with the secondary color theme using the 'link link-secondary' classes. It provides examples for both standard HTML and React JSX.

```html
<a class="link link-secondary">Click me</a>
```

```jsx
<a className="link link-secondary">Click me</a>
```

--------------------------------

### Design Complete Dashboard Layout with DaisyUI Drawer

Source: https://daisyui.com/pages/easy-css-library

Constructs a production-ready dashboard prototype with collapsible sidebar drawer, navbar, and statistics cards. Combines DaisyUI drawer, navbar, stats, and card components for rapid prototyping. Delivers complete layout functionality in minutes without custom CSS.

```HTML
<div class="drawer">
  <input id="drawer-toggle" type="checkbox" class="drawer-toggle" />
  <div class="drawer-content flex flex-col">
    <!-- Navbar -->
    <div class="navbar bg-base-300">
      <div class="flex-none">
        <label for="drawer-toggle" class="btn btn-square btn-ghost">☰</label>
      </div>
      <div class="flex-1">
        <a class="btn btn-ghost normal-case text-xl">Dashboard</a>
      </div>
    </div>
    <!-- Page content -->
    <div class="p-4">
      <div class="stats shadow">
        <div class="stat">
          <div class="stat-title">Total Users</div>
          <div class="stat-value">89,400</div>
        </div>
      </div>
    </div>
  </div>
  <div class="drawer-side">
    <label for="drawer-toggle" class="drawer-overlay"></label>
    <ul class="menu p-4 w-80 bg-base-200">
      <li><a>Analytics</a></li>
      <li><a>Users</a></li>
      <li><a>Settings</a></li>
    </ul>
  </div>
</div>
```

--------------------------------

### Install daisyUI as a Tailwind CSS Plugin

Source: https://daisyui.com/docs/v5

Demonstrates how to integrate daisyUI with Tailwind CSS 4 by importing it as a plugin directly within the CSS file, replacing the previous method of requiring it in the tailwind.config file.

```css
/* app.css */
@import "tailwindcss";
@plugin "daisyui";




```

--------------------------------

### Eleventy Configuration (eleventy.config.mjs)

Source: https://daisyui.com/docs/install/11ty

Configuration file for Eleventy using ES Modules. It sets up a PostCSS process to compile Tailwind CSS and daisyUI on the 'eleventy.before' event, ensuring styles are ready before the build.

```javascript
import fs from 'fs';
import path from 'path';
import postcss from 'postcss';
import tailwindcss from '@tailwindcss/postcss';

export default function (eleventyConfig) {
  eleventyConfig.on('eleventy.before', async () => {
    const tailwindInputPath = path.resolve('./src/styles/index.css');
    const tailwindOutputPath = './dist/styles/index.css';
    const cssContent = fs.readFileSync(tailwindInputPath, 'utf8');
    const outputDir = path.dirname(tailwindOutputPath);

    if (!fs.existsSync(outputDir)) {
      fs.mkdirSync(outputDir, { recursive: true });
    }

    const result = await postcss([tailwindcss()]).process(cssContent, {
      from: tailwindInputPath,
      to: tailwindOutputPath,
    });

    fs.writeFileSync(tailwindOutputPath, result.css);
  });

  return {
    dir: { input: 'src', output: 'dist' },
  };
}
```

--------------------------------

### Product Details Page Layout (Next.js)

Source: https://daisyui.com/blog/daisyui-nextjs-online-store-template

Example snippet showing the basic structure for a product details page in a Next.js application. It includes a placeholder for the product image component and sets up a responsive grid layout.

```javascript
const ProductDetails = () => {
  return (
    <div className="pb-20">
      <div className="mt-10 flex flex-col">
        <div className="flex flex-col lg:grid gap-6 lg:gap-12 lg:grid-cols-2">
          <ProductImage params={{ slug: slug as string }} />
        </div>
      </div>
    </div>
  );
};
```

--------------------------------

### Create Next.js Project

Source: https://daisyui.com/blog/install-daisyui-and-tailwindcss-in-nextjs

Command to initialize a new Next.js project. It prompts the user for configuration details, including enabling Tailwind CSS.

```bash
npx create-next-app@latest
```

--------------------------------

### daisyUI Loading Spinner Examples (HTML)

Source: https://daisyui.com/components/loading

Demonstrates how to implement the loading spinner component with different size classes in HTML. This component is purely visual and requires no additional JavaScript for its animation.

```html
<span class="loading loading-spinner loading-xs"></span>
<span class="loading loading-spinner loading-sm"></span>
<span class="loading loading-spinner loading-md"></span>
<span class="loading loading-spinner loading-lg"></span>
<span class="loading loading-spinner loading-xl"></span>
```

--------------------------------

### Configure Vite for Tailwind CSS in Solid

Source: https://daisyui.com/docs/install/solid

Configures the Vite build tool to include the Tailwind CSS plugin and the Solid.js plugin. Sets the development server port and build target.

```javascript
import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";
import solidPlugin from "vite-plugin-solid";

export default defineConfig({
  plugins: [tailwindcss(), solidPlugin()],
  server: {
    port: 3000,
  },
  build: {
    target: "esnext",
  },
});
```

--------------------------------

### Tailwind CSS Modal Example

Source: https://daisyui.com/pages/css-library-for-html

An example of a modal component built using only Tailwind CSS utility classes. It demonstrates the verbosity and potential for overwhelm when constructing UI elements solely with utility classes, requiring significant memorization and debugging time.

```html
<div class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
  <div class="bg-white rounded-lg shadow-xl max-w-md w-full p-6 relative">
    <button class="absolute top-4 right-4 text-gray-400 hover:text-gray-600 transition-colors">
      <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
      </svg>
    </button>
    <h3 class="text-xl font-bold text-gray-900 mb-4">Modal Title</h3>
    <p class="text-gray-600 mb-6">Modal content goes here.</p>
    <div class="flex justify-end space-x-3">
      <button class="px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-800 rounded-lg transition-colors">
        Cancel
      </button>
      <button class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg transition-colors">
        Confirm
      </button>
    </div>
  </div>
</div>
```

--------------------------------

### Homepage with daisyUI Button

Source: https://daisyui.com/docs/install/rails

An HTML view for a Rails page demonstrating the use of a daisyUI primary button.

```html
<button class="btn btn-primary">Hello daisyUI!</button>
```

--------------------------------

### Browser Mockup with DaisyUI

Source: https://daisyui.com/llms

Provides a box that resembles a browser window, including a toolbar. Used to display web content within a browser frame.

```html
<div class="mockup-browser">
  <div class="mockup-browser-toolbar">
    <div class="input input-bordered input-xs">https://daisyui.com</div>
  </div>
  <div class="mockup-browser-content">{CONTENT}</div>
</div>
```

--------------------------------

### Navbar Component Syntax

Source: https://daisyui.com/llms

Shows the basic structure for a DaisyUI navbar component. It uses the 'navbar' class for the main container and 'navbar-start', 'navbar-center', and 'navbar-end' for content alignment.

```html
<div class="navbar">{CONTENT}</div>
```

--------------------------------

### Configure daisyUI Blueprint MCP Server in Claude Desktop

Source: https://daisyui.com/docs/editor/claude

This configuration adds the official daisyUI Blueprint MCP server to Claude desktop. It requires a Blueprint license key, email, and optionally a Figma API key. Once configured, prompts can specify 'use Blueprint MCP' for enhanced daisyUI code generation.

```json
{
  "mcpServers": {
    "daisyui-blueprint": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "daisyui-blueprint@latest"],
      "env": {
        "LICENSE": "YOUR BLUEPRINT LICENSE KEY",
        "EMAIL": "YOUR EMAIL ADDRESS",
        "FIGMA": "YOUR FIGMA API KEY (optional)"
      }
    }
  }
}
```

--------------------------------

### Configure Browserslist for Turbopack Compatibility

Source: https://daisyui.com/docs/install/nextjs

Sets the `browserslist` in `package.json` to target modern browsers when using Turbopack. This helps avoid style issues caused by Lightning CSS polyfilling.

```bash
npm pkg set browserslist="> 1%"

```

--------------------------------

### Build Project for Production (npm)

Source: https://daisyui.com/blog/daisyui-nextjs-online-store-template

Generates an optimized static build of the Next.js application. This command prepares the site for deployment by creating production-ready assets.

```bash
npm run build
```

--------------------------------

### Configure Tailwind CSS with daisyUI

Source: https://daisyui.com/blog/how-to-install-sveltekit-and-daisyui

This snippet shows how to modify the `tailwind.config.js` file to include daisyUI as a plugin and specify the content files that Tailwind should scan for classes. The `content` array should point to your source files.

```javascript
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,svelte,js,ts}'],
  theme: {
    extend: {},
  },
  plugins: [require('daisyui')],
}
```

--------------------------------

### DaisyUI Multi-Column Footer Example

Source: https://daisyui.com/components/footer

This HTML snippet demonstrates a multi-column footer layout using DaisyUI classes. It includes navigation links organized into 'Services,' 'Company,' and 'Legal' sections. This footer is responsive and adapts to different screen sizes.

```html
<footer class="footer sm:footer-horizontal bg-base-200 text-base-content p-10">
  <nav>
    <h6 class="footer-title">Services</h6>
    <a class="link link-hover">Branding</a>
    <a class="link link-hover">Design</a>
    <a class="link link-hover">Marketing</a>
    <a class="link link-hover">Advertisement</a>
  </nav>
  <nav>
    <h6 class="footer-title">Company</h6>
    <a class="link link-hover">About us</a>
    <a class="link link-hover">Contact</a>
    <a class="link link-hover">Jobs</a>
    <a class="link link-hover">Press kit</a>
  </nav>
  <nav>
    <h6 class="footer-title">Legal</h6>
    <a class="link link-hover">Terms of use</a>
    <a class="link link-hover">Privacy policy</a>
    <a class="link link-hover">Cookie policy</a>
  </nav>
</footer>
```

--------------------------------

### Download Tailwind CSS Executable for Different OS

Source: https://daisyui.com/docs/install/zola

Downloads the Tailwind CSS executable tailored for different operating systems and architectures. These commands fetch the binary and save it to the 'static/' directory.

```bash
# Linux
curl -sLo static/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64
curl -sLo static/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-arm64-musl
curl -sLo static/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64
curl -sLo static/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64-musl

# MacOS
curl -sLo static/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-arm64
curl -sLo static/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-x64

# Windows
curl -sLo static\tailwindcss.exe https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-windows-x64.exe
```

--------------------------------

### Django Home View

Source: https://daisyui.com/docs/install/django

A simple Django view function that renders the 'index.html' template. This view is responsible for serving the homepage content.

```python
from django.shortcuts import render

def home(request):
    return render(request, 'index.html')
```

--------------------------------

### Download daisyUI Bundle Files

Source: https://daisyui.com/docs/install/django

Downloads the latest versions of daisyUI's main JavaScript bundle (daisyui.mjs) and theme configuration file (daisyui-theme.mjs). These files are placed alongside the Tailwind CSS executable.

```shell
curl -sLO myapp/static/css/daisyui.mjs https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.mjs
curl -sLO myapp/static/css/daisyui-theme.mjs https://github.com/saadeghi/daisyui/releases/latest/download/daisyui-theme.mjs
```

--------------------------------

### Configure daisyUI Blueprint MCP Server in Cursor

Source: https://daisyui.com/docs/editor/cursor

This JSON configuration adds the 'daisyui-blueprint' MCP server to Cursor's settings. It utilizes `npx` to run `daisyui-blueprint@latest` and requires environment variables for license, email, and optionally a Figma API key.

```json
{
  "mcpServers": {
+   "daisyui-blueprint": {
+     "type": "stdio",
+     "command": "npx",
+     "args": ["-y", "daisyui-blueprint@latest"],
+     "env": {
+       "LICENSE": "YOUR BLUEPRINT LICENSE KEY",
+       "EMAIL": "YOUR EMAIL ADDRESS",
+       "FIGMA": "YOUR FIGMA API KEY (optional)"
+     }
+   }
  }
}
```

--------------------------------

### DaisyUI HTML Rating Component Examples

Source: https://daisyui.com/components/rating

These examples demonstrate the basic structure of a DaisyUI rating component using standard HTML. They show how to create a group of radio inputs styled as stars, with different sizes (md, xl) and a pre-selected option.

```html
<div class="rating rating-md">
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="1 star" />
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="2 star" />
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="3 star" checked="checked" />
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="4 star" />
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="5 star" />
</div>
<!-- xl -->
<div class="rating rating-xl">
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="1 star" />
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="2 star" checked="checked" />
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="3 star" />
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="4 star" />
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="5 star" />
</div>
```

--------------------------------

### DaisyUI Collapse with Icon Moved to Start (HTML)

Source: https://daisyui.com/components/collapse

This DaisyUI collapse component demonstrates moving the expansion icon to the start of the collapse title using utility classes like `after:start-5 after:end-auto`. It also adjusts padding with `pe-4 ps-12` for visual alignment. This is a pure HTML implementation.

```html
<div tabindex="0" class="collapse collapse-arrow bg-base-100 border-base-300 border">
  <div class="collapse-title font-semibold after:start-5 after:end-auto pe-4 ps-12">How do I create an account?</div>
  <div class="collapse-content text-sm">
    Click the "Sign Up" button in the top right corner and follow the registration process.
  </div>
</div>
```

--------------------------------

### Rails Routes for Homepage

Source: https://daisyui.com/docs/install/rails

Defines the root route for the Rails application to point to the `pages#home` action.

```ruby
Rails.application.routes.draw do
  root to: 'pages#home'
end
```

--------------------------------

### Badge as Indicator Example (React JSX)

Source: https://daisyui.com/components/indicator

Provides a React JSX example for using a badge as an indicator. This is effective for highlighting new items or unread counts associated with content blocks.

```jsx
<div className="indicator">
  <span className="indicator-item badge badge-primary">New</span>
  <div className="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

--------------------------------

### Make Tailwind CSS Executable (Linux/MacOS)

Source: https://daisyui.com/docs/install/yew

Changes the file permissions to make the downloaded Tailwind CSS executable file runnable on Linux and MacOS systems.

```bash
chmod +x tailwindcss

```

--------------------------------

### Indicator Middle and Start Alignment with DaisyUI

Source: https://daisyui.com/components/indicator

Combines vertical middle alignment with horizontal start alignment for an indicator using DaisyUI. This requires 'indicator-item', 'indicator-middle', and 'indicator-start' classes.

```html
<div class="indicator">
  <span
    class="indicator-item indicator-middle indicator-start badge badge-secondary"
  ></span>
  <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

```jsx
<div className="indicator">
  <span
    className="indicator-item indicator-middle indicator-start badge badge-secondary"
  ></span>
  <div className="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

--------------------------------

### Update Mockup Phone Component Classes

Source: https://daisyui.com/docs/upgrade

Details the renaming of internal classes within the `mockup-phone` component for better organization. `camera` is now `mockup-phone-camera` and `display` is `mockup-phone-display`.

```html
<div class="mockup-phone">
  <div class="camera"></div>
  <div class="display">
    <div class="artboard artboard-demo phone-1">Hi.</div>
  </div>
</div>
```

```html
<div class="mockup-phone">
  <div class="mockup-phone-camera"></div>
  <div class="mockup-phone-display">
    <div class="w-[320px] h-[568px]">Hi.</div>
  </div>
</div>
```

--------------------------------

### Migrate from Utility Approach to Semantic Components

Source: https://daisyui.com/pages/tailwind-css-alternative

Example showing migration from pure Tailwind utility classes to daisyUI semantic components. Demonstrates how to replace verbose utility combinations with concise semantic class names for buttons.

```html
<!-- Old utility approach -->
<button class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
  Old Button
</button>

<!-- New semantic approach -->
<button class="btn btn-primary">New Button</button>
```

--------------------------------

### Divider with Colors

Source: https://daisyui.com/components/divider

This example showcases how to apply different color themes to DaisyUI dividers. It includes examples for default, neutral, primary, secondary, accent, success, warning, info, and error color variants. These are achieved by adding specific classes to the divider element.

```html
<div class="flex w-full flex-col">
  <div class="divider">Default</div>
  <div class="divider divider-neutral">Neutral</div>
  <div class="divider divider-primary">Primary</div>
  <div class="divider divider-secondary">Secondary</div>
  <div class="divider divider-accent">Accent</div>
  <div class="divider divider-success">Success</div>
  <div class="divider divider-warning">Warning</div>
  <div class="divider divider-info">Info</div>
  <div class="divider divider-error">Error</div>
</div>
```

```jsx
<div className="flex w-full flex-col">
  <div className="divider">Default</div>
  <div className="divider divider-neutral">Neutral</div>
  <div className="divider divider-primary">Primary</div>
  <div className="divider divider-secondary">Secondary</div>
  <div className="divider divider-accent">Accent</div>
  <div className="divider divider-success">Success</div>
  <div className="divider divider-warning">Warning</div>
  <div className="divider divider-info">Info</div>
  <div className="divider divider-error">Error</div>
</div>
```

--------------------------------

### Error Color Link with DaisyUI

Source: https://daisyui.com/components/link

This example illustrates how to style a link with the error color theme using the 'link link-error' classes. It includes examples for both standard HTML and React JSX.

```html
<a class="link link-error">Click me</a>
```

```jsx
<a className="link link-error">Click me</a>
```

--------------------------------

### CSS Cross-Browser Compatibility Techniques

Source: https://daisyui.com/pages/easy-css-library

Demonstrates CSS techniques for ensuring compatibility across different web browsers, including fallbacks for older versions. It addresses the need for defensive coding to handle variations in CSS interpretation.

```css
/* Supporting all browsers means extra code */
.flexible-layout {
  display: -webkit-box; /* Old Safari */
  display: -ms-flexbox; /* IE 10 */
  display: flex; /* Modern browsers */
  
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  
  gap: 1rem; /* Doesn't work in older browsers */
  /* Fallback spacing for older browsers */
}

.flexible-layout > * + * {
  margin-top: 1rem;
}
```

--------------------------------

### Basic DaisyUI Tooltip Example

Source: https://daisyui.com/components/tooltip

Demonstrates a simple tooltip that appears when hovering over a button. It uses the `tooltip` class and the `data-tip` attribute to define the tooltip's content. This is the most straightforward way to implement tooltips in DaisyUI.

```html
<div class="tooltip" data-tip="hello">
  <button class="btn">Hover me</button>
</div>
```

```html
<div className="tooltip" data-tip="hello">
  <button className="btn">Hover me</button>
</div>
```

--------------------------------

### Basic Button Styling with CSS

Source: https://daisyui.com/pages/easy-css-library

Demonstrates the extensive CSS properties required to create a basic interactive button, including styling for default, hover, focus, disabled, and active states. This highlights the complexity developers face when styling even simple elements from scratch.

```css
/* Just to create a proper button */
.button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.5rem 1rem;
  border: 1px solid transparent;
  border-radius: 0.375rem;
  font-size: 0.875rem;
  font-weight: 500;
  line-height: 1.25rem;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.15s ease-in-out;
  user-select: none;
  white-space: nowrap;
}

.button:hover {
  background-color: #e5e7eb;
}

.button:focus {
  outline: 2px solid transparent;
  outline-offset: 2px;
  box-shadow: 0 0 0 2px #3b82f6;
}

.button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.button:active {
  transform: translateY(0.5px);
}

/* And this is just one button variant! */
```

--------------------------------

### Hero Section Example

Source: https://daisyui.com/pages/ui-library-for-hackaton

This code snippet demonstrates a complete hero section using daisyUI components. It's designed for rapid implementation and visual appeal, requiring only a few lines of HTML within a Tailwind CSS project.

```html
<div class="hero min-h-screen bg-base-200">
  <div class="hero-content text-center">
    <div class="max-w-md">
      <h1 class="text-5xl font-bold">Hello Hackathon!</h1>
      <p class="py-6">Your amazing idea deserves an amazing demo. Built with daisyUI in minutes, not hours.</p>
      <button class="btn btn-primary">Get Started</button>
    </div>
  </div>
</div>
```

--------------------------------

### Django Homepage Template

Source: https://daisyui.com/docs/install/django

An HTML template for a Django homepage. It includes a title, loads static files, and links to a CSS file (output.css) for styling, along with a primary button styled by daisyUI.

```html
<!DOCTYPE html>
<html>
<head>
    <title>My Django App</title>
    {% load static %}
    <link href="{% static 'css/output.css' %}" rel="stylesheet" type="text/css" />
</head>
<body>
    <button class="btn btn-primary">Hello daisyUI</button>
</body>
</html>
```

--------------------------------

### Download Tailwind CSS Executable (Windows)

Source: https://daisyui.com/docs/install/django

Downloads the Tailwind CSS standalone executable for Windows (x64 architecture). The executable is saved to the static CSS directory.

```shell
# Windows
curl -sLo myapp/static/css/tailwindcss.exe https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-windows-x64.exe
```

--------------------------------

### Make Tailwind CSS Executable (Linux/macOS)

Source: https://daisyui.com/docs/install/standalone

A command to grant execute permissions to the downloaded Tailwind CSS executable file on Linux and macOS systems.

```shell
chmod +x tailwindcss
```

--------------------------------

### Django Settings: Add App

Source: https://daisyui.com/docs/install/django

Includes the 'myapp' application in the INSTALLED_APPS list within the Django project's settings.py file. This registers the app with Django, allowing it to be used.

```python
  INSTALLED_APPS = [
      "django.contrib.admin",
      "django.contrib.auth",
      "django.contrib.contenttypes",
      "django.contrib.sessions",
      "django.contrib.messages",
      "django.contrib.staticfiles",
+     "myapp",
  ]
```

--------------------------------

### Configuring daisyUI 5 with a Single Theme (Light)

Source: https://daisyui.com/llms

This configuration limits daisyUI to only use the 'light' theme. It's useful for projects that require a consistent, single theme.

```css
@plugin "daisyui" {
  themes: light --default;
}
```

--------------------------------

### Import CSS in Astro Layout

Source: https://daisyui.com/docs/install/astro

Imports the configured CSS file into the main Astro layout file (Layout.astro) to apply the styles globally.

```html
---
import "../assets/app.css";
---

```

--------------------------------

### Configure PostCSS for Tailwind CSS

Source: https://daisyui.com/docs/install/nextjs

Sets up the PostCSS configuration file to include Tailwind CSS. This allows PostCSS to process Tailwind's utility classes.

```javascript
/** @type {import('postcss-load-config').Config} */
const config = {
  plugins: {
    '@tailwindcss/postcss': {},
  },
};
export default config;

```

--------------------------------

### Indicator for Button Example (React JSX)

Source: https://daisyui.com/components/indicator

Presents a React JSX example for using an indicator with a button. This pattern is useful for UI elements that require a numerical badge, such as notification counts for interactive buttons.

```jsx
<div className="indicator">
  <span className="indicator-item badge badge-secondary">12</span>
  <button className="btn">inbox</button>
</div>
```

--------------------------------

### DaisyUI Chat Bubble Component Example

Source: https://daisyui.com/codepen

Illustrates a chat bubble component from DaisyUI, showing a message from a user with an avatar. This snippet includes the avatar styling and the chat bubble containing text and a link.

```html
<div class="chat chat-start m-4">
  <div class="avatar chat-image">
    <div class="w-10 rounded-full">
      <img src="https://img.daisyui.com/images/profile/people/pouya-saadeghi.webp" />
    </div>
  </div>
  <div class="chat-bubble">see all components <a class="link" target="_blank" href="https://daisyui.com/components">Here</a></div>
</div>
```

--------------------------------

### DaisyUI Toast: Start and Middle Alignment

Source: https://daisyui.com/components/toast

Displays toast notifications aligned to the start and middle of the viewport. This is useful for non-intrusive messages that appear on the side. It uses standard HTML and DaisyUI classes.

```html
<div class="toast toast-start toast-middle">
  <div class="alert alert-info">
    <span>New mail arrived.</span>
  </div>
  <div class="alert alert-success">
    <span>Message sent successfully.</span>
  </div>
</div>
```

```jsx
<div className="toast toast-start toast-middle">
  <div className="alert alert-info">
    <span>New mail arrived.</span>
  </div>
  <div className="alert alert-success">
    <span>Message sent successfully.</span>
  </div>
</div>
```

--------------------------------

### Loading Indicators with DaisyUI

Source: https://daisyui.com/llms

Displays an animation to indicate that content is loading. Supports various styles like spinner, dots, and ring, along with different sizes.

```html
<span class="loading loading-spinner"></span>
<span class="loading loading-dots loading-lg"></span>
<span class="loading loading-ring loading-xl"></span>
```

--------------------------------

### Import UnoCSS Styles

Source: https://daisyui.com/docs/install/unocss

Adds UnoCSS reset styles and the main UnoCSS import to the `src/main.js` file. This ensures that UnoCSS and its presets are applied correctly to the application.

```javascript
import "@unocss/reset/tailwind.css";
import "uno.css";
```

--------------------------------

### Configure PostCSS for Rsbuild

Source: https://daisyui.com/docs/install/rsbuild

Sets up the PostCSS configuration file (`postcss.config.mjs`) to include the Tailwind CSS plugin, which is essential for using Tailwind directives.

```javascript
const config = {
  plugins: {
    '@tailwindcss/postcss': {},
  },
};
export default config;

```

--------------------------------

### Configure SvelteKit Preprocessing

Source: https://daisyui.com/blog/how-to-install-sveltekit-and-daisyui

This shows the necessary addition to `svelte.config.js` to enable Vite preprocessing, which is required for SvelteKit to handle CSS transformations correctly when using Tailwind CSS and daisyUI.

```javascript
import adapter from '@sveltejs/adapter-auto';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  preprocess: vitePreprocess(),
  kit: {
    // adapter-auto only supports some environments, see https://kit.svelte.dev/docs/adapter-auto for a list.
    // If your environment is not supported or you settled on a specific environment, switch out the adapter.
    // See https://kit.svelte.dev/docs/adapters for more information about adapters.
    adapter: adapter()
  }
};

export default config;

```

--------------------------------

### DaisyUI Card Component Examples

Source: https://daisyui.com/components/card

Demonstrates the structure of a basic card component in DaisyUI, including its body, title, description, and action buttons. This component is reusable and can be customized with various CSS classes for styling and sizing.

```html
<div class="card w-96 bg-base-100 card-xl shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Xlarge Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

```html
<div class="card w-96 bg-base-100 card-xs shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Xsmall Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

```html
<div class="card w-96 bg-base-100 card-sm shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Small Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

```html
<div class="card w-96 bg-base-100 card-md shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Medium Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

```html
<div class="card w-96 bg-base-100 card-lg shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Large Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

```html
<div class="card w-96 bg-base-100 card-xl shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Xlarge Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

--------------------------------

### Build CSS with PostCSS CLI

Source: https://daisyui.com/blog/npm-init-daisyui

This command compiles your CSS file using the PostCSS CLI, which can be configured with plugins like Autoprefixer. It's an alternative to the Tailwind CSS CLI for building your styles.

```bash
npx postcss-cli tailwind.css -o output.css
```

--------------------------------

### Unreadable Tailwind CSS Card Component Example

Source: https://daisyui.com/pages/css-library-for-html

Highlights the significant readability and maintainability challenges that arise from using extensive utility classes in Tailwind CSS for complex components. The example of a card component shows how a single element can become cluttered with numerous classes, making it difficult to parse and modify.

```html
<!-- A simple card component -->
<div class="max-w-sm mx-auto bg-white rounded-xl shadow-lg overflow-hidden md:max-w-2xl m-3 hover:shadow-xl transition-shadow duration-300">
  <div class="md:flex">
    <div class="md:shrink-0">
      <img class="h-48 w-full object-cover md:h-full md:w-48" src="image.jpg" alt="Album">
    </div>
    <div class="p-8">
      <div class="uppercase tracking-wide text-sm text-indigo-500 font-semibold">Article</div>
      <a href="#" class="block mt-1 text-lg leading-tight font-medium text-black hover:underline">Card title</a>
      <p class="mt-2 text-slate-500">Card description goes here...</p>
    </div>
  </div>
</div>
```

--------------------------------

### Info Color Link with DaisyUI

Source: https://daisyui.com/components/link

This example demonstrates styling a link with the info color theme using the 'link link-info' classes, presented in both HTML and React JSX formats.

```html
<a class="link link-info">Click me</a>
```

```jsx
<a className="link link-info">Click me</a>
```

--------------------------------

### Add Context7 MCP Server (Local Connection)

Source: https://daisyui.com/docs/editor/claudecode

This command sets up a local connection to the Context7 MCP server using the '@upstash/context7-mcp' package. This is suitable for local development environments.

```bash
claude mcp add context7 -- npx -y @upstash/context7-mcp
```

--------------------------------

### Build CSS with Tailwind CLI (Linux/macOS)

Source: https://daisyui.com/docs/install/standalone

Command to compile `input.css` into `output.css` using the Tailwind CSS standalone executable. Includes the `--watch` flag for automatic updates.

```shell
./tailwindcss -i input.css -o output.css --watch
```

--------------------------------

### HTML Card Component: Traditional CSS vs. daisyUI Comparison

Source: https://daisyui.com/pages/easy-css-library

Compares the development time and complexity of creating a card component using traditional CSS versus daisyUI. The traditional CSS approach requires significant custom styling, while the daisyUI approach achieves a similar result in seconds with minimal markup.

```html
<!-- Traditional CSS: 2-3 hours -->
<div class="custom-card">
  <img class="custom-image" src="photo.jpg" alt="Photo" />
  <div class="custom-content">
    <h3 class="custom-title">Card Title</h3>
    <p class="custom-description">Description text</p>
    <button class="custom-button custom-button-primary">Action</button>
  </div>
</div>

<style>
.custom-card {
  width: 24rem;
  background-color: white;
  border-radius: 0.75rem;
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.custom-image {
  width: 100%;
  height: 12rem;
  object-fit: cover;
}

.custom-content {
  padding: 2rem;
}

.custom-title {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
  color: #1f2937;
}

.custom-description {
  color: #6b7280;
  margin-bottom: 1rem;
}

.custom-button {
  background-color: #3b82f6;
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 0.375rem;
  border: none;
  font-weight: 500;
  cursor: pointer;
  transition: background-color 0.15s ease-in-out;
}

.custom-button:hover {
  background-color: #2563eb;
}
</style>

<!-- daisyUI: 30 seconds -->
<div class="card w-96 bg-base-100 shadow-xl">
  <figure><img src="photo.jpg" alt="Album" /></figure>
  <div class="card-body">
    <h2 class="card-title">Card Title</h2>
    <p>Description text</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Action</button>
    </div>
  </div>
</div>
```

--------------------------------

### Dioxus App Component with daisyUI Button

Source: https://daisyui.com/docs/install/dioxus

Sets up the main Dioxus application component (`App`) to include a stylesheet for Tailwind CSS/daisyUI and a button styled with the 'btn' class from daisyUI. This code replaces the default content in `src/main.rs`.

```rust
use dioxus::prelude::*;

fn main() {
    dioxus::launch(App);
}

#[component]
fn App() -> Element {
    rsx! {
        document::Stylesheet {href: asset!("/assets/main.css")} 
        button { class: "btn", "Hello daisyUI" }
    }
}
```

--------------------------------

### DaisyUI Tabs Component (HTML)

Source: https://daisyui.com/tailwindplay

Illustrates the creation of a tabbed interface using DaisyUI's 'tabs' and 'tab' classes. The example features a 'tabs-lift' style and highlights an active tab, demonstrating basic navigation structure.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DaisyUI Tabs</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.1.17/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<!-- tab -->
<div class="tabs tabs-lift p-4">
<button class="tab">Tab 1</button>
<button class="tab tab-active">Tab 2</button>
<button class="tab">Tab 3</button>
<button class="tab"></button>
</div>

</body>
</html>
```

--------------------------------

### Configure Tailwind CSS and daisyUI

Source: https://daisyui.com/docs/install/dioxus

Defines the Tailwind CSS and daisyUI configuration in a `tailwind.css` file. This file specifies source files, imports Tailwind CSS, and applies the daisyUI plugin.

```css
@source "./src/**/*.{rs,html,css}";
@import "tailwindcss";
@plugin "daisyui";
```

--------------------------------

### Force Close Dropdown Example (HTML & React JSX)

Source: https://daisyui.com/components/dropdown

Illustrates how to force a DaisyUI dropdown to be closed using the 'dropdown-close' class. This is typically used when the dropdown should be hidden by default or after an action. Examples are provided in HTML and React JSX.

```html
<div class="dropdown dropdown-close">
  <div tabindex="0" role="button" class="btn m-1">Button</div>
  <ul tabindex="-1" class="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

```jsx
<div className="dropdown dropdown-close">
  <div tabIndex={0} role="button" className="btn m-1">Button</div>
  <ul tabIndex="-1" className="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

--------------------------------

### Text Formatting Examples with daisyUI and Tailwind CSS Typography

Source: https://daisyui.com/docs/layout-and-typography

Showcases various text formatting options including bold, italic, and combinations thereof, leveraging daisyUI's theming and Tailwind CSS Typography for emphasis and readability.

```html
<b>Bold</b> text is perfect for highlighting key points.
<i>Italic</i> text is great for emphasizing specific words.
<b><i>Bold and Italic</i></b> text can be used for extra emphasis.
```

--------------------------------

### Indicator for Tab Example (React JSX)

Source: https://daisyui.com/components/indicator

Provides a React JSX example of using a badge indicator within DaisyUI's tab component. This is useful for visually highlighting tabs with new or relevant information, such as unread counts.

```jsx
<div className="tabs tabs-lift">
  <a className="tab">Messages</a>
  <a className="indicator tab tab-active">
    Notifications
    <span className="indicator-item badge">8</span>
  </a>
  <a className="tab">Requests</a>
</div>
```

--------------------------------

### Customize Hero Section in Astro Component

Source: https://daisyui.com/blog/how-to-make-a-blog-quickly-using-astro-and-daisyUI

Modify the hero section of the blog by editing the src/components/Hero.astro file to display personalized introduction text, images, and branding. This section uses daisyUI components like badges and HTML structure for layout.

```astro
<div class="text-center pt-10">
  <div class="badge badge-outline badge-lg">Hello!</div>
  <h1 class="text-4xl md:text-5xl xl:text-7xl font-semibold brightness-150">
    I'm <span class="text-primary">Antonio,</span>
    <br />
    Digital Marketer & Founder
  </h1>
</div>

<img
  src="/images/antonio.png"
  alt="Antonio"
  class="max-w-xs md:max-w-lg mt-4 absolute"
/>

<img src="/images/bg.png" alt="bg" height="{500}" width="{700}" />
```

--------------------------------

### DaisyUI Button Join with Pagination

Source: https://daisyui.com/components/pagination

Demonstrates a basic button join for pagination with numerical page links. This example shows how to group sequential page numbers within a join component.

```html
<div class="join">
  <button class="join-item btn">1</button>
  <button class="join-item btn">2</button>
  <button class="join-item btn btn-disabled">...</button>
  <button class="join-item btn">99</button>
  <button class="join-item btn">100</button>
</div>
```

```jsx
<div className="join">
  <button className="join-item btn">1</button>
  <button className="join-item btn">2</button>
  <button className="join-item btn btn-disabled">...</button>
  <button className="join-item btn">99</button>
  <button className="join-item btn">100</button>
</div>
```

--------------------------------

### Add Tailwind CSS and daisyUI to CSS

Source: https://daisyui.com/docs/install/astro

Integrates Tailwind CSS and daisyUI into the main CSS file by importing them. This replaces any existing styles.

```css
@import "tailwindcss";
@plugin "daisyui";

```

--------------------------------

### daisyUI Loading Dots Examples (HTML)

Source: https://daisyui.com/components/loading

Illustrates the use of the loading dots animation style with different size variations in standard HTML. This component provides a subtle loading indicator.

```html
<span class="loading loading-dots loading-xs"></span>
<span class="loading loading-dots loading-sm"></span>
<span class="loading loading-dots loading-md"></span>
<span class="loading loading-dots loading-lg"></span>
<span class="loading loading-dots loading-xl"></span>
```

--------------------------------

### HTML Structure with daisyUI Button

Source: https://daisyui.com/docs/install/elysia

A basic HTML file that includes the generated CSS file (`output.css`) and demonstrates a primary button styled with daisyUI classes.

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/output.css">
  </head>
  <body>
    <button class="btn btn-primary">Hello daisyUI</button>
  </body>
</html>

```

--------------------------------

### Setup daisyUI llms.txt in Cline VSCode Extension

Source: https://daisyui.com/docs/editor/cline

This command downloads the daisyUI llms.txt file, a text version of daisyUI documentation, to be used by the Cline VSCode extension for accurate code generation. It saves the file to the `.clinerules/daisyui.md` path within your workspace.

```bash
curl -L https://daisyui.com/llms.txt --create-dirs -o .clinerules/daisyui.md
```

--------------------------------

### Save DaisyUI llms.txt to Cursor Workspace

Source: https://daisyui.com/docs/editor/cursor

This terminal command downloads the DaisyUI `llms.txt` file and saves it to the `.cursor/rules/daisyui.mdc` path within your project. This enables persistent access for Cursor's AI to DaisyUI documentation.

```bash
curl -L https://daisyui.com/llms.txt --create-dirs -o .cursor/rules/daisyui.mdc
```

--------------------------------

### Import Tailwind CSS in SvelteKit Layout

Source: https://daisyui.com/blog/how-to-install-sveltekit-and-daisyui

This command creates a new `+layout.svelte` file in the `src/routes` directory and imports the Tailwind CSS stylesheet. This ensures that Tailwind's styles are applied globally to your SvelteKit application.

```bash
echo '
<script>
  import "tailwindcss/tailwind.css";
</script>

<slot />
' > src/routes/+layout.svelte
```

--------------------------------

### Build CSS with Tailwind CLI (Windows)

Source: https://daisyui.com/docs/install/standalone

Command to compile `input.css` into `output.css` using the Tailwind CSS standalone executable on Windows. Includes the `--watch` flag for automatic updates.

```shell
tailwindcss.exe -i input.css -o output.css --watch
```

--------------------------------

### Make Tailwind CSS Executable (Linux/macOS)

Source: https://daisyui.com/docs/install/django

Grants execute permissions to the downloaded Tailwind CSS binary on Linux and macOS systems. This step is necessary to run the Tailwind CSS command-line tool.

```shell
chmod +x myapp/static/css/tailwindcss
```

--------------------------------

### Progress Bar Component Syntax

Source: https://daisyui.com/llms

Provides the syntax for a DaisyUI progress bar. The 'progress' class is used, along with optional color modifiers. The 'value' and 'max' attributes are mandatory.

```html
<progress class="progress {MODIFIER}" value="50" max="100"></progress>
```

--------------------------------

### Add CSS Build Script to package.json (JSON)

Source: https://daisyui.com/docs/install/postcss

Defines a script in the 'package.json' file to compile the CSS using PostCSS. This script takes 'app.css' as input and outputs to 'public/output.css'.

```json
{
  "scripts": {
    "build:css": "postcss app.css -o public/output.css"
  }
}
```

--------------------------------

### HTML Structure for daisyUI

Source: https://daisyui.com/docs/install/bun

Basic HTML file structure that includes a link to the `style.css` file and a sample button with a daisyUI class. This file will be served by the Bun dev server.

```html
<!doctype html>
<html>
  <head>
    <title>daisyUI</title>
    <link rel="stylesheet" href="./style.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  </head>
  <body>
    <button class="btn">daisyUI Button</button>
  </body>
</html>
```

--------------------------------

### Elysia Server with CSS Watcher

Source: https://daisyui.com/docs/install/elysia

Sets up an Elysia server to serve static files and automatically rebuilds the CSS using Tailwind CLI whenever changes are detected in the `public` directory. Requires `@elysiajs/static` and Node.js `child_process` and `fs` modules.

```typescript
import { Elysia } from "elysia";
import { staticPlugin } from '@elysiajs/static'
import { exec } from 'child_process'
import { watch } from 'fs'

const buildCSS = () =>
  new Promise(resolve =>
    exec('tailwindcss -i ./src/app.css -o ./public/output.css',
      (_error, _stdout, stderr) => {
        console.log(stderr);
        resolve(null);
      })
  );

await buildCSS();

const watcher = watch('./public', { recursive: true },
  async () => {
    await buildCSS();
  }
);

process.on('SIGINT', () => {
  watcher.close();
  process.exit(0);
});

const app = new Elysia()
	.use(
		staticPlugin({
			assets: "public",
      prefix: "",
		}),
	)
	.listen(3000, ({ hostname, port }) => {
		console.log(`Server started http://${hostname}:${port}`);
	});

```

--------------------------------

### DaisyUI JSX Rating Component Examples

Source: https://daisyui.com/components/rating

These JSX examples demonstrate how to implement DaisyUI rating components within a React application. They showcase various sizes (xs, sm, md, lg, xl) and how to set a default checked state using the 'defaultChecked' prop.

```jsx
<div>
  {/* xs */}
  <div className="rating rating-xs">
    <input type="radio" name="rating-5" className="mask mask-star-2 bg-orange-400" aria-label="1 star" />
    <input type="radio" name="rating-5" className="mask mask-star-2 bg-orange-400" aria-label="2 star" defaultChecked />
    <input type="radio" name="rating-5" className="mask mask-star-2 bg-orange-400" aria-label="3 star" />
    <input type="radio" name="rating-5" className="mask mask-star-2 bg-orange-400" aria-label="4 star" />
    <input type="radio" name="rating-5" className="mask mask-star-2 bg-orange-400" aria-label="5 star" />
  </div>
  {/* sm */}
  <div className="rating rating-sm">
    <input type="radio" name="rating-6" className="mask mask-star-2 bg-orange-400" aria-label="1 star" />
    <input type="radio" name="rating-6" className="mask mask-star-2 bg-orange-400" aria-label="2 star" defaultChecked />
    <input type="radio" name="rating-6" className="mask mask-star-2 bg-orange-400" aria-label="3 star" />
    <input type="radio" name="rating-6" className="mask mask-star-2 bg-orange-400" aria-label="4 star" />
    <input type="radio" name="rating-6" className="mask mask-star-2 bg-orange-400" aria-label="5 star" />
  </div>
  {/* md */}
  <div className="rating rating-md">
    <input type="radio" name="rating-7" className="mask mask-star-2 bg-orange-400" aria-label="1 star" />
    <input type="radio" name="rating-7" className="mask mask-star-2 bg-orange-400" aria-label="2 star" defaultChecked />
    <input type="radio" name="rating-7" className="mask mask-star-2 bg-orange-400" aria-label="3 star" />
    <input type="radio" name="rating-7" className="mask mask-star-2 bg-orange-400" aria-label="4 star" />
    <input type="radio" name="rating-7" className="mask mask-star-2 bg-orange-400" aria-label="5 star" />
  </div>
  {/* lg */}
  <div className="rating rating-lg">
    <input type="radio" name="rating-8" className="mask mask-star-2 bg-orange-400" aria-label="1 star" />
    <input type="radio" name="rating-8" className="mask mask-star-2 bg-orange-400" aria-label="2 star" defaultChecked />
    <input type="radio" name="rating-8" className="mask mask-star-2 bg-orange-400" aria-label="3 star" />
    <input type="radio" name="rating-8" className="mask mask-star-2 bg-orange-400" aria-label="4 star" />
    <input type="radio" name="rating-8" className="mask mask-star-2 bg-orange-400" aria-label="5 star" />
  </div>
  {/* xl */}
  <div className="rating rating-xl">
    <input type="radio" name="rating-9" className="mask mask-star-2 bg-orange-400" aria-label="1 star" />
    <input type="radio" name="rating-9" className="mask mask-star-2 bg-orange-400" aria-label="2 star" defaultChecked />
    <input type="radio" name="rating-9" className="mask mask-star-2 bg-orange-400" aria-label="3 star" />
    <input type="radio" name="rating-9" className="mask mask-star-2 bg-orange-400" aria-label="4 star" />
    <input type="radio" name="rating-9" className="mask mask-star-2 bg-orange-400" aria-label="5 star" />
  </div>
</div>
```

--------------------------------

### Build Responsive Navigation Bar with DaisyUI

Source: https://daisyui.com/pages/easy-css-library

Creates a responsive navbar component with dropdown menu for mobile navigation and brand/call-to-action elements. Uses DaisyUI navbar, dropdown, and button components with responsive classes for mobile-first design. Supports mobile and desktop layouts automatically.

```HTML
<div class="navbar bg-base-100">
  <div class="navbar-start">
    <div class="dropdown">
      <label tabindex="0" class="btn btn-ghost lg:hidden">Menu</label>
      <ul class="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52">
        <li><a>Item 1</a></li>
        <li><a>Item 2</a></li>
      </ul>
    </div>
    <a class="btn btn-ghost normal-case text-xl">Brand</a>
  </div>
  <div class="navbar-end">
    <a class="btn">Get started</a>
  </div>
</div>
```

--------------------------------

### Add Yew Dependency to Cargo.toml

Source: https://daisyui.com/docs/install/yew

Specifies the 'yew' crate as a dependency in the Cargo.toml file, enabling its use in the Rust project for front-end development.

```toml
[package]
name = "yew-app"
version = "0.1.0"
edition = "2025"

[dependencies]
+ yew = { git = "https://github.com/yewstack/yew/", features = ["csr"] }

```

--------------------------------

### Update Stack Component Sizing

Source: https://daisyui.com/docs/upgrade

Explains the change in how the Stack component is sized. Instead of sizing individual items, the width and height are now applied directly to the `stack` container itself.

```html
<div class="stack">
  <div class="card bg-base-100 w-36 h-36">Text</div>
  <div class="card bg-base-100 w-36 h-36">Text</div>
  <div class="card bg-base-100 w-36 h-36">Text</div>
</div>
```

```html
<div class="stack w-36 h-32">
  <div class="card bg-base-100">Text</div>
  <div class="card bg-base-100">Text</div>
  <div class="card bg-base-100">Text</div>
</div>
```

--------------------------------

### Window Mockup with Border - HTML

Source: https://daisyui.com/components/mockup-window

This code snippet demonstrates how to create a window mockup with a border using daisyUI classes. It requires no external dependencies and generates a basic OS window structure.

```html
<div class="mockup-window border border-base-300 w-full">
  <div class="grid place-content-center border-t border-base-300 h-80">Hello!</div>
</div>
```

--------------------------------

### DaisyUI Code Mockup Without Prefix

Source: https://daisyui.com/components/mockup-code

An example of the code mockup component used without any line prefixes. This provides a clean display for code snippets where line numbering or command prompts are not necessary. It relies solely on the `mockup-code` and `pre` tags for styling.

```html
<div class="mockup-code w-full">
  <pre><code>without prefix</code></pre>
</div>
```

```html
<div className="mockup-code w-full">
  <pre><code>without prefix</code></pre>
</div>
```

--------------------------------

### Django URL Configuration for Home View

Source: https://daisyui.com/docs/install/django

Adds a URL pattern to the Django project's URL configuration (urls.py) to map the root URL ('') to the 'home' view function. This makes the homepage accessible.

```python
from django.contrib import admin
from django.urls import path
+ from . import views

urlpatterns = [
    path("admin/", admin.site.urls),
+    path("", views.home, name="home"),
]
```

--------------------------------

### daisyUI Loading Ring Examples (JSX)

Source: https://daisyui.com/components/loading

Demonstrates the loading ring component in JSX, allowing developers to integrate it into React applications with different size settings. This provides a clear visual indication of loading.

```jsx
<span className="loading loading-ring loading-xs"></span>
<span className="loading loading-ring loading-sm"></span>
<span className="loading loading-ring loading-md"></span>
<span className="loading loading-ring loading-lg"></span>
<span className="loading loading-ring loading-xl"></span>
```

--------------------------------

### Create Production-Ready Alert Component with DaisyUI

Source: https://daisyui.com/pages/easy-css-library

Displays a success alert with icon and message text using DaisyUI's alert component with semantic styling. Includes embedded SVG icon and shadow effects for visual hierarchy. Ensures accessibility compliance and professional appearance for production applications.

```HTML
<div class="alert alert-success shadow-lg">
  <div>
    <svg class="stroke-current flex-shrink-0 w-6 h-6" fill="none" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
    </svg>
    <span>Your purchase has been confirmed!</span>
  </div>
</div>
```

--------------------------------

### DaisyUI Card Component HTML Examples

Source: https://daisyui.com/components/card

This snippet displays multiple card components in HTML using DaisyUI classes. It shows cards of different sizes (x-small to x-large) with consistent internal structure including a title, paragraph, and a 'Buy Now' button within an action div.

```html
<div class="card w-96 bg-base-100 card-xs shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Xsmall Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div class="card w-96 bg-base-100 card-sm shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Small Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div class="card w-96 bg-base-100 card-md shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Medium Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div class="card w-96 bg-base-100 card-lg shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Large Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div class="card w-96 bg-base-100 card-xl shadow-sm">
  <div class="card-body">
    <h2 class="card-title">Xlarge Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div class="justify-end card-actions">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

--------------------------------

### Dropdown Aligns to Start of Button Horizontally (HTML)

Source: https://daisyui.com/components/dropdown

This HTML snippet demonstrates a dropdown component from DaisyUI that aligns its menu to the start of the trigger button horizontally. It utilizes the 'dropdown-start' class for alignment. The dropdown contains a button and a list of menu items.

```html
<div class="dropdown dropdown-start">
  <div tabindex="0" role="button" class="btn m-1">Click ⬇️</div>
  <ul tabindex="-1" class="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

--------------------------------

### Configure Astro for Tailwind CSS

Source: https://daisyui.com/docs/install/astro

Adds the Tailwind CSS Vite plugin to the Astro configuration file (astro.config.mjs).

```javascript
// @ts-check
import { defineConfig } from "astro/config";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  vite: {
    plugins: [tailwindcss()],
  },
});

```

--------------------------------

### DaisyUI Collapse with Icon Moved to Start (React)

Source: https://daisyui.com/components/collapse

A React version of the DaisyUI collapse component with the icon positioned at the start. It employs the `collapse-arrow` class and custom utility classes (`after:start-5 after:end-auto`, `pe-4 ps-12`) for icon and padding adjustments within a JSX structure.

```jsx
<div tabIndex={0} className="collapse collapse-arrow bg-base-100 border-base-300 border">
  <div className="collapse-title font-semibold after:start-5 after:end-auto pe-4 ps-12">How do I create an account?</div>
  <div className="collapse-content text-sm">
    Click the "Sign Up" button in the top right corner and follow the registration process.
  </div>
</div>
```

--------------------------------

### DaisyUI Toast: Start and Bottom Alignment (Default)

Source: https://daisyui.com/components/toast

Presents toast notifications aligned to the start (left side) and bottom of the viewport, which is the default vertical positioning. This is suitable for less critical, persistent messages. The code uses standard HTML and DaisyUI classes.

```html
<div class="toast toast-start">
  <div class="alert alert-info">
    <span>New mail arrived.</span>
  </div>
  <div class="alert alert-success">
    <span>Message sent successfully.</span>
  </div>
</div>
```

```jsx
<div className="toast toast-start">
  <div className="alert alert-info">
    <span>New mail arrived.</span>
  </div>
  <div className="alert alert-success">
    <span>Message sent successfully.</span>
  </div>
</div>
```

--------------------------------

### React JSX Scrollable Steps Example

Source: https://daisyui.com/components/steps

This React JSX snippet demonstrates the creation of scrollable step indicators using DaisyUI. Similar to the HTML version, it wraps the steps in a div with 'overflow-x-auto' for horizontal scrolling. The example uses JSX syntax with 'className' instead of 'class' for applying CSS classes.

```jsx
<div className="overflow-x-auto">
  <ul className="steps">
    <li className="step">start</li>
    <li className="step step-secondary">2</li>
    <li className="step step-secondary">3</li>
    <li className="step step-secondary">4</li>
    <li className="step">5</li>
    <li className="step step-accent">6</li>
    <li className="step step-accent">7</li>
    <li className="step">8</li>
    <li className="step step-error">9</li>
    <li className="step step-error">10</li>
    <li className="step">11</li>
    <li className="step">12</li>
    <li className="step step-warning">13</li>
    <li className="step step-warning">14</li>
    <li className="step">15</li>
    <li className="step step-neutral">16</li>
    <li className="step step-neutral">17</li>
    <li className="step step-neutral">18</li>
    <li className="step step-neutral">19</li>
    <li className="step step-neutral">20</li>
    <li className="step step-neutral">21</li>
    <li className="step step-neutral">22</li>
    <li className="step step-neutral">23</li>
    <li className="step step-neutral">end</li>
  </ul>
</div>
```

--------------------------------

### Chat Bubble with Start and End Alignment - HTML

Source: https://daisyui.com/components/chat

Creates two chat bubbles with different horizontal alignments using chat-start and chat-end classes. The first bubble aligns to the start (left) and the second to the end (right), demonstrating basic conversation layout with multi-line content support.

```html
<div class="chat chat-start">
  <div class="chat-bubble">
    It's over Anakin,
    <br />
    I have the high ground.
  </div>
</div>
<div class="chat chat-end">
  <div class="chat-bubble">You underestimate my power!</div>
</div>
```

--------------------------------

### Configure Lemon Squeezy API Key

Source: https://daisyui.com/blog/daisyui-nextjs-online-store-template

Sets up the environment variable to connect your online store to the Lemon Squeezy API. Replace 'your_api_key_here' with your actual API key. This enables fetching real product data.

```env
LEMON_SQUEEZY_API_KEY=your_api_key_here
```

--------------------------------

### Add daisyUI via downloaded mjs files

Source: https://daisyui.com/docs/install/rails

Commands to download daisyUI and daisyUI-theme mjs files for integration without Node.js. This method is recommended for users not using Node.js.

```bash
curl -sLo app/assets/tailwind/daisyui.mjs https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.mjs
curl -sLo app/assets/tailwind/daisyui-theme.mjs https://github.com/saadeghi/daisyui/releases/latest/download/daisyui-theme.mjs
```

--------------------------------

### Import CSS in Svelte Page

Source: https://daisyui.com/docs/install/sveltekit

Imports the configured CSS file (src/app.css) into a Svelte page or layout component (src/routes/+page.svelte). This makes the styles available throughout the application.

```svelte
<script>
  import "../app.css";
</script>

```

--------------------------------

### Dropdown Aligns to Start of Button Horizontally (React)

Source: https://daisyui.com/components/dropdown

This React snippet demonstrates a dropdown component from DaisyUI that aligns its menu to the start of the trigger button horizontally. It utilizes the 'dropdown-start' class for alignment. The dropdown contains a button and a list of menu items.

```jsx
<div className="dropdown dropdown-start">
  <div tabIndex={0} role="button" className="btn m-1">Click ⬇️</div>
  <ul tabIndex="-1" className="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

--------------------------------

### UnoCSS Configuration for daisyUI

Source: https://daisyui.com/docs/install/unocss

Sets up the UnoCSS configuration in `unocss.config.js`. It includes the daisyUI preset and presetWind4, and specifies content sources for scanning class names.

```javascript
import { defineConfig } from "unocss";
import presetWind4 from "@unocss/preset-wind4";
import { presetDaisy } from "@ameinhardt/unocss-preset-daisy";

export default defineConfig({
  content: {
    pipeline: {
      include: ["src/**/*.{js,ts}"],
    },
  },
  presets: [presetDaisy(), presetWind4()],
});
```

--------------------------------

### CSS File with Tailwind CSS and daisyUI Imports

Source: https://daisyui.com/docs/install/11ty

The main CSS file for the Eleventy project. It imports Tailwind CSS, the Tailwind Typography plugin, and daisyUI using the `@import` and `@plugin` directives.

```css
@import 'tailwindcss';
@plugin "@tailwindcss/typography";
@plugin "daisyui";
```

--------------------------------

### Configure PostCSS with Tailwind CSS (JavaScript)

Source: https://daisyui.com/docs/install/postcss

Sets up the PostCSS configuration file to include the Tailwind CSS PostCSS plugin. This file should be named 'postcss.config.mjs'.

```javascript
const config = {
  plugins: {
    '@tailwindcss/postcss': {},
  },
};
export default config;
```

--------------------------------

### Download Tailwind CSS Executable (macOS)

Source: https://daisyui.com/docs/install/django

Downloads the Tailwind CSS standalone executable for macOS, supporting both ARM64 and x64 architectures. The downloaded file is placed in the static CSS directory.

```shell
# MacOS
curl -sLo myapp/static/css/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-arm64
curl -sLo myapp/static/css/tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-x64
```

--------------------------------

### Multi-line DaisyUI Code Mockup

Source: https://daisyui.com/components/mockup-code

Renders multiple lines of code, simulating a terminal output with different prefixes and status indicators. This component is ideal for showing command execution sequences, including installation steps and completion messages. It uses multiple `pre` elements within the `mockup-code` container.

```html
<div class="mockup-code w-full">
  <pre data-prefix="$"><code>npm i daisyui</code></pre>
  <pre data-prefix=">" class="text-warning"><code>installing...</code></pre>
  <pre data-prefix=">" class="text-success"><code>Done!</code></pre>
</div>
```

```html
<div className="mockup-code w-full">
  <pre data-prefix="$"><code>npm i daisyui</code></pre>
  <pre data-prefix=">" className="text-warning"><code>installing...</code></pre>
  <pre data-prefix=">" className="text-success"><code>Done!</code></pre>
</div>
```

--------------------------------

### Button Styles with daisyUI

Source: https://daisyui.com/pages/ui-library-for-hackaton

This example showcases various button styles available in daisyUI. By changing a single class, developers can instantly apply different appearances like primary, secondary, accent, or ghost to their buttons.

```html
<!-- Try different button styles instantly -->
<button class="btn btn-primary">Primary Action</button>
<button class="btn btn-secondary">Secondary Action</button>
<button class="btn btn-accent">Accent Action</button>
<button class="btn btn-ghost">Ghost Action</button>
```

--------------------------------

### Menu Component with DaisyUI

Source: https://daisyui.com/llms

Used to display lists of links vertically or horizontally. Supports dropdowns, active states, and different sizes. Can be made responsive.

```html
<ul class="menu menu-vertical">
  <li><button>Item 1</button></li>
  <li><button>Item 2</button></li>
</ul>

<ul class="menu menu-horizontal menu-lg">
  <li><button>Item A</button></li>
  <li><button>Item B</button></li>
</ul>
```

--------------------------------

### Update Card Compact to Small Size

Source: https://daisyui.com/docs/upgrade

Illustrates the change from `card-compact` to `card-sm` for controlling the size of the Card component, providing a more intuitive sizing system.

```html
<div class="card card-compact">
  <!-- ... -->
</div>
```

```html
<div class="card card-sm">
  <!-- ... -->
</div>
```

--------------------------------

### DaisyUI Stats Component Example (HTML)

Source: https://daisyui.com/components/stat

This HTML snippet demonstrates the basic structure of the DaisyUI Stats component. It displays download counts, new user figures, and new register data using predefined CSS classes. This component is built with Tailwind CSS and is easily customizable.

```html
<div class="stats shadow">
  <div class="stat">
    <div class="stat-figure text-secondary">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        class="inline-block h-8 w-8 stroke-current"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
        ></path>
      </svg>
    </div>
    <div class="stat-title">Downloads</div>
    <div class="stat-value">31K</div>
    <div class="stat-desc">Jan 1st - Feb 1st</div>
  </div>

  <div class="stat">
    <div class="stat-figure text-secondary">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        class="inline-block h-8 w-8 stroke-current"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"
        ></path>
      </svg>
    </div>
    <div class="stat-title">New Users</div>
    <div class="stat-value">4,200</div>
    <div class="stat-desc">↗︎ 400 (22%)</div>
  </div>

  <div class="stat">
    <div class="stat-figure text-secondary">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        class="inline-block h-8 w-8 stroke-current"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4"
        ></path>
      </svg>
    </div>
    <div class="stat-title">New Registers</div>
    <div class="stat-value">1,200</div>
    <div class="stat-desc">↘︎ 90 (14%)</div>
  </div>
</div>
```

--------------------------------

### HTML Structure with daisyUI Button (`src/index.html`)

Source: https://daisyui.com/docs/install/electron

Basic HTML structure for an Electron app's renderer process. It includes meta tags for character set and content security policy, links the generated CSS file, and displays a button styled with a daisyUI class.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <!-- https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self'">
    <link rel="stylesheet" type="text/css" href="../public/output.css">
  </head>
  <body>
    <button class="btn">Hello daisyUI</button>
  </body>
</html>
```

--------------------------------

### Configure Tailwind CSS and daisyUI Input

Source: https://daisyui.com/docs/install/zola

Sets up the main CSS input file for Tailwind CSS, importing Tailwind itself and daisyUI plugins. It also demonstrates how to include custom themes.

```css
@import "tailwindcss";

@source not "./daisyui{,*}.mjs";

@plugin "./daisyui.mjs";

/* Optional for custom themes – Docs: https://daisyui.com/docs/themes/#how-to-add-a-new-custom-theme */
@plugin "./daisyui-theme.js"{
  /* custom theme here */
}
```

--------------------------------

### Configure Vite for UnoCSS

Source: https://daisyui.com/docs/install/unocss

Integrates UnoCSS into the Vite build process by adding the unocss plugin to the `vite.config.js` file. This enables UnoCSS transformations during development and build.

```javascript
import { defineConfig } from 'vite';
import unocss from "unocss/vite";

export default defineConfig({
  plugins: [
    unocss()
  ],
});
```

--------------------------------

### Create a Button with daisyUI

Source: https://daisyui.com/blog/daisyui-vs-tailwindui

Demonstrates how to create a simple button using daisyUI's `btn` class. daisyUI simplifies styling by providing component classes that work with Tailwind CSS.

```html
<button class="btn">Button</button>
```

--------------------------------

### DaisyUI Tooltip - Accent Color (HTML)

Source: https://daisyui.com/components/tooltip

This example shows an accent-colored tooltip implemented with DaisyUI. The 'tooltip-accent' and 'btn-accent' classes are applied for styling. The tooltip content is 'accent'.

```html
<div class="tooltip tooltip-open tooltip-accent" data-tip="accent">
  <button class="btn btn-accent">accent</button>
</div>
```

--------------------------------

### Configure daisyUI GitMCP Server in Cursor

Source: https://daisyui.com/docs/editor/cursor

This JSON configuration adds the 'daisyui-github' MCP server to Cursor. It specifies a URL for the GitMCP service, allowing Cursor to interact with DaisyUI documentation hosted on gitmcp.io.

```json
{
  "mcpServers": {
+   "daisyui-github": {
+     "url": "https://gitmcp.io/saadeghi/daisyui"
+   }
  }
}
```

--------------------------------

### Configure Context7 MCP Server in Cursor

Source: https://daisyui.com/docs/editor/cursor

This JSON configuration adds the 'Context7' MCP server to Cursor. It uses `npx` to run `@upstash/context7-mcp@latest`, providing an alternative AI backend for DaisyUI related queries.

```json
{
  "mcpServers": {
+   "Context7": {
+     "type": "stdio",
+     "command": "npx",
+     "args": ["-y", "@upstash/context7-mcp@latest"]
+   }
  }
}
```

--------------------------------

### Generate output.css with Tailwind CSS (Linux/macOS)

Source: https://daisyui.com/docs/install/django

Runs the Tailwind CSS executable to process input.css and generate output.css, which contains the compiled Tailwind and daisyUI styles. The --watch flag enables automatic recompilation on file changes.

```shell
myapp/static/css/tailwindcss -i myapp/static/css/input.css -o myapp/static/css/output.css --watch
```

--------------------------------

### Configure Tailwind CSS and daisyUI Input

Source: https://daisyui.com/docs/install/django

Defines the input CSS file (input.css) for Tailwind CSS, importing Tailwind directives and daisyUI plugins. This file specifies how Tailwind and daisyUI should be processed.

```css
@import "tailwindcss";

@source not "./tailwindcss";
@source not "./daisyui{*}.mjs";

@plugin "./daisyui.mjs";

/* Optional for custom themes – Docs: https://daisyui.com/docs/themes/#how-to-add-a-new-custom-theme */
@plugin "./daisyui-theme.mjs"{
  /* custom theme here */
}
```

--------------------------------

### Radial Progress Component Syntax

Source: https://daisyui.com/llms

Shows how to implement a radial progress bar using DaisyUI. It utilizes a 'div' element with the 'radial-progress' class and CSS variables for value, size, and thickness.

```html
<div class="radial-progress" style="--value:70;" aria-valuenow="70" role="progressbar">70%</div>
```

--------------------------------

### DaisyUI Mockup Code with Primary Color

Source: https://daisyui.com/components/mockup-code

This example shows how to use the `mockup-code` component with a primary background color and primary content text. It utilizes standard HTML and CSS classes provided by daisyUI.

```html
<div class="mockup-code bg-primary text-primary-content w-full">
  <pre><code>can be any color!</code></pre>
</div>
```

```html
<div class="mockup-code bg-primary text-primary-content w-full">
  <pre><code>can be any color!</code></pre>
</div>
```

--------------------------------

### Configure Vite for Tailwind CSS

Source: https://daisyui.com/docs/install/sveltekit

Adds the tailwindcss plugin to the Vite configuration file (vite.config.js). This ensures Tailwind CSS is processed correctly within the SvelteKit build.

```javascript
import tailwindcss from "@tailwindcss/vite";
import { sveltekit } from "@sveltejs/kit/vite";
import { defineConfig } from "vite";

export default defineConfig({
  plugins: [tailwindcss(), sveltekit()],
});

```

--------------------------------

### DaisyUI Warning Tooltip

Source: https://daisyui.com/components/tooltip

Displays a warning-themed tooltip with associated button. This example shows the basic implementation of a warning tooltip in DaisyUI. It requires the DaisyUI CSS to be included in the project.

```html
<div class="tooltip tooltip-open tooltip-warning" data-tip="warning">
  <button class="btn btn-warning">warning</button>
</div>
```

```jsx
<div className="tooltip tooltip-open tooltip-warning" data-tip="warning">
  <button className="btn btn-warning">warning</button>
</div>
```

--------------------------------

### Badge as Indicator Example (HTML)

Source: https://daisyui.com/components/indicator

Shows how to use a badge as an indicator on another element, such as displaying a 'New' notification count. This utilizes the `indicator-item` class with the `badge` component.

```html
<div class="indicator">
  <span class="indicator-item badge badge-primary">New</span>
  <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

--------------------------------

### DaisyUI Card Component JSX Examples

Source: https://daisyui.com/components/card

This snippet demonstrates the implementation of DaisyUI card components using JSX syntax, likely within a React environment. It mirrors the HTML structure, showcasing cards of varying sizes (x-small to x-large) with the same content and button.

```jsx
<div className="card w-96 bg-base-100 card-xs shadow-sm">
  <div className="card-body">
    <h2 className="card-title">Xsmall Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div className="justify-end card-actions">
      <button className="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div className="card w-96 bg-base-100 card-sm shadow-sm">
  <div className="card-body">
    <h2 className="card-title">Small Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div className="justify-end card-actions">
      <button className="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div className="card w-96 bg-base-100 card-md shadow-sm">
  <div className="card-body">
    <h2 className="card-title">Medium Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div className="justify-end card-actions">
      <button className="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div className="card w-96 bg-base-100 card-lg shadow-sm">
  <div className="card-body">
    <h2 className="card-title">Large Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div className="justify-end card-actions">
      <button className="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>

<div className="card w-96 bg-base-100 card-xl shadow-sm">
  <div className="card-body">
    <h2 className="card-title">Xlarge Card</h2>
    <p>A card component has a figure, a body part, and inside body there are title and actions parts</p>
    <div className="justify-end card-actions">
      <button className="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

--------------------------------

### DaisyUI Steps with Custom Colors (HTML)

Source: https://daisyui.com/components/steps

Shows how to apply custom color themes to DaisyUI steps, such as 'info' and 'error'. This example uses 'step-info' for the first three steps and 'step-error' with a 'data-content' attribute for the final step, indicating a potential issue or a distinct final state.

```html
<ul class="steps">
  <li class="step step-info">Fly to moon</li>
  <li class="step step-info">Shrink the moon</li>
  <li class="step step-info">Grab the moon</li>
  <li class="step step-error" data-content="?">Sit on toilet</li>
</ul>
```

```jsx
<ul className="steps">
  <li className="step step-info">Fly to moon</li>
  <li className="step step-info">Shrink the moon</li>
  <li className="step step-info">Grab the moon</li>
  <li className="step step-error" data-content="?">Sit on toilet</li>
</ul>
```

--------------------------------

### Update Card Border Class

Source: https://daisyui.com/docs/upgrade

Demonstrates the renaming of the `card-bordered` class to `card-border` for consistency within the Card component styling.

```html
<div class="card card-bordered">
  <!-- ... -->
</div>
```

```html
<div class="card card-border">
  <!-- ... -->
</div>
```

--------------------------------

### CSS for Card Component Styling

Source: https://daisyui.com/pages/easy-css-library

Illustrates CSS code snippets used for styling a card component, focusing on background color, border, and text color. It also shows a hover state for a button within the context of a card, demonstrating the need for careful color choices and design considerations.

```css
/* Which colors actually work together? */
.card {
  background-color: #f8fafc; /* Light gray */
  border: 1px solid #e2e8f0; /* Medium gray */
  color: #1e293b; /* Dark gray */
}

/* How do you create hover states that feel natural? */
.button:hover {
  background-color: #3730a3; /* Is this the right shade? */
}
```

--------------------------------

### Replace btn-group and input-group with join Component in HTML

Source: https://daisyui.com/docs/upgrade

Migrate from deprecated btn-group and input-group components to the join component with join-item class for grouped buttons and inputs with improved styling and flexibility.

```html
before
<div class="btn-group">
  <button class="btn">Button 1</button>
  <button class="btn">Button 2</button>
</div>

after
<div class="join">
  <button class="btn join-item">Button 1</button>
  <button class="btn join-item">Button 2</button>
</div>
```

--------------------------------

### HTML Modals: Dialog, Checkbox, Anchor Links

Source: https://daisyui.com/llms

Demonstrates three methods for implementing modals in HTML using DaisyUI: the standard HTML dialog element, a legacy checkbox-based approach, and a legacy anchor link method. Each method has specific syntax and rules for opening and closing.

```html
<button onclick="my_modal.showModal()">Open modal</button>
<dialog id="my_modal" class="modal">
  <div class="modal-box">{CONTENT}</div>
  <form method="dialog" class="modal-backdrop"><button>close</button></form>
</dialog>
```

```html
<label for="my-modal" class="btn">Open modal</label>
<input type="checkbox" id="my-modal" class="modal-toggle" />
<div class="modal">
  <div class="modal-box">{CONTENT}</div>
  <label class="modal-backdrop" for="my-modal">Close</label>
</div>
```

```html
<a href="#my-modal" class="btn">Open modal</a>
<div class="modal" id="my-modal">
  <div class="modal-box">{CONTENT}</div>
</div>
```

--------------------------------

### React Custom Line Height Example

Source: https://daisyui.com/components/text-rotate

This React component showcases custom line height in daisyUI using 'leading-[value]'. It's functionally identical to the HTML example, applying a large line height to enhance vertical spacing for tall text. This code is suitable for React projects utilizing daisyUI.

```jsx
<span className="text-rotate text-7xl leading-[2]">
  <span className="justify-items-center">
    <span>📐 DESIGN</span>
    <span>⌨️ DEVELOP</span>
    <span>🌎 DEPLOY</span>
    <span>🌱 SCALE</span>
    <span>🔧 MAINTAIN</span>
    <span>♻️ REPEAT</span>
  </span>
</span>
```

--------------------------------

### Configure Vite with Tailwind CSS and Preact

Source: https://daisyui.com/docs/install/preact

Update the Vite configuration file to include Tailwind CSS and Preact plugins. This enables Tailwind CSS processing and Preact-specific optimizations during the build process.

```javascript
import { defineConfig } from 'vite'
import tailwindcss from "@tailwindcss/vite";
import preact from '@preact/preset-vite'

export default defineConfig({
  plugins: [tailwindcss(), preact()],
})
```

--------------------------------

### Tailwind CSS Button with Utility Classes

Source: https://daisyui.com/blog/full-circle

This example demonstrates a button created using only Tailwind CSS utility classes. It showcases the verbosity and potential maintenance challenges of a utility-first approach for complex components, requiring numerous classes for styling and states.

```html
<button
  class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-700 focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:outline-none disabled:cursor-not-allowed disabled:opacity-50"
>
  Button
</button>
```

--------------------------------

### HTML DaisyUI Footer with Form

Source: https://daisyui.com/components/footer

A standard HTML implementation of a DaisyUI footer. It includes navigation links organized into columns (Services, Company, Legal) and a newsletter signup form with input and submit button. This example uses basic HTML and DaisyUI classes.

```html
<footer class="footer sm:footer-horizontal bg-base-200 text-base-content p-10">
  <nav>
    <h6 class="footer-title">Services</h6>
    <a class="link link-hover">Branding</a>
    <a class="link link-hover">Design</a>
    <a class="link link-hover">Marketing</a>
    <a class="link link-hover">Advertisement</a>
  </nav>
  <nav>
    <h6 class="footer-title">Company</h6>
    <a class="link link-hover">About us</a>
    <a class="link link-hover">Contact</a>
    <a class="link link-hover">Jobs</a>
    <a class="link link-hover">Press kit</a>
  </nav>
  <nav>
    <h6 class="footer-title">Legal</h6>
    <a class="link link-hover">Terms of use</a>
    <a class="link link-hover">Privacy policy</a>
    <a class="link link-hover">Cookie policy</a>
  </nav>
  <form>
    <h6 class="footer-title">Newsletter</h6>
    <fieldset class="w-80">
      <label>Enter your email address</label>
      <div class="join">
        <input
          type="text"
          placeholder="username@site.com"
          class="input input-bordered join-item" />
        <button class="btn btn-primary join-item">Subscribe</button>
      </div>
    </fieldset>
  </form>
</footer>
```

--------------------------------

### Advanced daisyUI 5 Configuration with Customizations

Source: https://daisyui.com/llms

This advanced configuration enables all built-in themes, sets 'bumblebee' as the default and 'synthwave' for dark mode. It also excludes specific components from the prefixing and disables console logging.

```css
@plugin "daisyui" {
  themes: light, dark, cupcake, bumblebee --default, emerald, corporate, synthwave --prefersdark, retro, cyberpunk, valentine, halloween, garden, forest, aqua, lofi, pastel, fantasy, wireframe, black, luxury, dracula, cmyk, autumn, business, acid, lemonade, night, coffee, winter, dim, nord, sunset, caramellatte, abyss, silk;
  root: ":root";
  include: ;
  exclude: rootscrollgutter, checkbox;
  prefix: daisy-;
  logs: false;
}
```

--------------------------------

### Modal Dialogs with DaisyUI

Source: https://daisyui.com/llms

Used to display dialogs or boxes, often triggered by a button click. Supports various placements like top, middle, and bottom, and can be opened programmatically.

```html
<!-- Button to open modal -->
<label for="my-modal-3" class="btn modal-toggle">Open Modal</label>

<!-- Put this part before </body> tag -->
<input type="checkbox" id="my-modal-3" class="modal-toggle" />
<div class="modal modal-bottom sm:modal-middle">
  <div class="modal-box">
    <h3 class="font-bold text-lg">Congratulations!</h3>
    <p class="py-4">You've been selected for a discount!</p>
    <div class="modal-action">
      <label for="my-modal-3" class="btn">Close</label>
    </div>
  </div>
</div>
```

--------------------------------

### DaisyUI Info Progress Bar in HTML

Source: https://daisyui.com/components/progress

Presents the DaisyUI progress bar component styled with the 'info' color theme in HTML. This example shows how to apply the `progress-info` class to change the bar's appearance while maintaining functionality.

```html
<progress class="progress progress-info w-56" value="0" max="100"></progress>
<progress class="progress progress-info w-56" value="10" max="100"></progress>
<progress class="progress progress-info w-56" value="40" max="100"></progress>
<progress class="progress progress-info w-56" value="70" max="100"></progress>
<progress class="progress progress-info w-56" value="100" max="100"></progress>
```

--------------------------------

### daisyUI Loading Dots Examples (JSX)

Source: https://daisyui.com/components/loading

Presents the loading dots component in JSX format, suitable for React projects, demonstrating different size configurations. This offers a simple yet effective way to show loading states.

```jsx
<span className="loading loading-dots loading-xs"></span>
<span className="loading loading-dots loading-sm"></span>
<span className="loading loading-dots loading-md"></span>
<span className="loading loading-dots loading-lg"></span>
<span className="loading loading-dots loading-xl"></span>
```

--------------------------------

### Build CSS using Tailwind CSS Executable

Source: https://daisyui.com/docs/install/zola

Compiles the CSS input file into an output CSS file using the downloaded Tailwind CSS executable. The `--watch` flag enables live updates when the input file changes.

```bash
./static/tailwindcss -i static/input.css -o static/output.css --watch
# For Windows
static\tailwindcss.exe -i static\input.css -o static\output.css --watch
```

--------------------------------

### Configure Tailwind CSS and daisyUI in app.css

Source: https://daisyui.com/docs/install/laravel

This configuration integrates Tailwind CSS with daisyUI by importing Tailwind CSS, specifying source files for CSS processing, and enabling the daisyUI plugin.

```css
@import "tailwindcss";

@source "../**/*.blade.php";
@source "../**/*.js";
@source "../../vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php";
@source "../../storage/framework/views/*.php";

@plugin "daisyui";
```

--------------------------------

### Status Indicator Example (HTML)

Source: https://daisyui.com/components/indicator

Demonstrates how to use the indicator component to display a status indicator, such as a success icon, on the corner of another element. This is useful for visually representing the state of an item.

```html
<div class="indicator">
  <span class="indicator-item status status-success"></span>
  <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

--------------------------------

### Dropdown with Details and Summary (JSX)

Source: https://daisyui.com/components/dropdown

This example shows how to create a dropdown using 'details' and 'summary' elements within a JSX environment, likely for a framework like React. It utilizes daisyUI classes for styling and functionality, mirroring the HTML approach but adapted for JSX syntax.

```jsx
<details className="dropdown">
  <summary className="btn m-1">open or close</summary>
  <ul className="menu dropdown-content bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</details>
```

--------------------------------

### Skeleton Loading Component

Source: https://daisyui.com/llms

Component for displaying loading states with optional text skeleton modifier. Supports height and width utility classes (h-* and w-*) to customize dimensions.

```html
<div class="skeleton"></div>
```

```html
<div class="skeleton skeleton-text">Loading data...</div>
```

--------------------------------

### Configure Vite for Tailwind CSS

Source: https://daisyui.com/docs/install/lit

Adds the Tailwind CSS Vite plugin to the Vite configuration file (`vite.config.js`). This ensures that Tailwind CSS is processed correctly during the build.

```javascript
import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  plugins: [
    tailwindcss()
  ],
});
```

--------------------------------

### Configure daisyUI GitMCP Server in VSCode Workspace

Source: https://daisyui.com/docs/editor/vscode

This JSON configuration integrates the 'daisyUI' GitMCP server for your current workspace. It specifies the server type as 'sse' and provides the URL for the daisyUI GitMCP service.

```json
{
  "servers": {
    "daisyUI": {
      "type": "sse",
      "url": "https://gitmcp.io/saadeghi/daisyui"
    }
  }
}
```

--------------------------------

### Tailwind CSS Configuration for DaisyUI (JavaScript)

Source: https://daisyui.com/resources/videos/nextjs-13-e-commerce-tutorial-app-router-typescript-deployment-tailwindcss-prisma-daisyui-k4zif0mhblc

Configuration file for Tailwind CSS, enabling DaisyUI component styling. This setup defines the theme, plugins, and other customization options for Tailwind CSS, ensuring DaisyUI components are correctly integrated and styled within the project.

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    // Or if using `src` directory:
    "./src/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
};

```

--------------------------------

### Stacked Cards with Shadows HTML Example

Source: https://daisyui.com/components/stack

Shows how to apply varying shadow effects to stacked cards using DaisyUI's shadow utility classes. This allows for depth and emphasis on individual cards within the stack.

```html
<div class="stack">
  <div class="card bg-base-200 text-center shadow-md">
    <div class="card-body">A</div>
  </div>
  <div class="card bg-base-200 text-center shadow">
    <div class="card-body">B</div>
  </div>
  <div class="card bg-base-200 text-center shadow-sm">
    <div class="card-body">C</div>
  </div>
</div>
```

```jsx
<div className="stack">
  <div className="card bg-base-200 text-center shadow-md">
    <div className="card-body">A</div>
  </div>
  <div className="card bg-base-200 text-center shadow">
    <div className="card-body">B</div>
  </div>
  <div className="card bg-base-200 text-center shadow-sm">
    <div className="card-body">C</div>
  </div>
</div>
```

--------------------------------

### Progressive Button Styling with daisyUI and Tailwind Utilities

Source: https://daisyui.com/pages/tailwind-css-alternative

Illustrates the gradual learning curve of daisyUI, allowing developers to start with simple semantic classes and progressively add Tailwind CSS utilities for customization or to create variations.

```html
<!-- Start simple -->
<button class="btn btn-primary">Click me</button>

<!-- Add utilities for customization -->
<button class="btn btn-primary lg:btn-lg xl:w-full">Click me</button>

<!-- Or create variations -->
<button class="btn btn-primary hover:scale-105 transition-transform">Click me</button>
```

--------------------------------

### Design Professional Login Form with DaisyUI

Source: https://daisyui.com/pages/easy-css-library

Builds a complete login form using DaisyUI card, form-control, input, label, and button components. Demonstrates consistent styling across form elements with accessibility-compliant labels and inputs. Ensures uniform appearance regardless of developer experience level.

```HTML
<form class="card w-full max-w-sm bg-base-100 shadow-xl">
  <div class="card-body">
    <h2 class="card-title">Login</h2>
    <div class="form-control w-full max-w-xs">
      <label class="label">
        <span class="label-text">Email</span>
      </label>
      <input type="email" class="input input-bordered w-full max-w-xs" />
    </div>
    <div class="form-control w-full max-w-xs">
      <label class="label">
        <span class="label-text">Password</span>
      </label>
      <input type="password" class="input input-bordered w-full max-w-xs" />
    </div>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Login</button>
    </div>
  </div>
</form>
```

--------------------------------

### Add Social Media Links in Hero Component

Source: https://daisyui.com/blog/how-to-make-a-blog-quickly-using-astro-and-daisyUI

Update social media links in the src/components/Hero.astro file using daisyUI button components and SVG icons. This enables visitors to connect with the blog author across various platforms.

```astro
<div class="flex justify-center lg:justify-start space-x-4 mt-4">
  <a
    class="btn btn-circle btn-md"
    href="https://www.x.com"
    aria-label="twitter"
  >
    <svg viewBox="0 0 24 24" aria-hidden="true" class="h-8 w-8">
      <path
        d="M13.3174 10.7749L19.1457 4H17.7646L12.7039 9.88256L8.66193 4H4L10.1122 12.8955L4 20H5.38119L10.7254 13.7878L14.994 20H19.656L13.3171 10.7749H13.3174ZM11.4257 12.9738L10.8064 12.0881L5.87886 5.03974H8.00029L11.9769 10.728L12.5962 11.6137L17.7652 19.0075H15.6438L11.4257 12.9742V12.9738Z"
        fill="currentColor"
      ></path>
    </svg>
  </a>
</div>
```

--------------------------------

### daisyUI Loading Spinner Examples (JSX)

Source: https://daisyui.com/components/loading

Shows how to use the loading spinner component with various size options in JSX, commonly used in React applications. The implementation is similar to HTML but uses JSX syntax for class names.

```jsx
<span className="loading loading-spinner loading-xs"></span>
<span className="loading loading-spinner loading-sm"></span>
<span className="loading loading-spinner loading-md"></span>
<span className="loading loading-spinner loading-lg"></span>
<span className="loading loading-spinner loading-xl"></span>
```

--------------------------------

### Basic Button Styling with daisyUI

Source: https://daisyui.com/index

Demonstrates how to style a simple button using daisyUI's component class names combined with Tailwind CSS utilities. The example shows a button with the 'btn' and 'btn-primary' classes.

```html
<a class="btn btn-primary">Button</a>
```

--------------------------------

### Generate output.css with Tailwind CSS (Windows)

Source: https://daisyui.com/docs/install/django

Executes the Tailwind CSS build process on Windows, generating output.css from input.css. The --watch option ensures that the CSS file is updated automatically when source files are modified.

```shell
myappstaticcss\tailwindcss.exe -i myapp/static/css/input.css -o myapp/static/css/output.css --watch
```

--------------------------------

### CSS for Card Layout and Visual Rhythm

Source: https://daisyui.com/pages/easy-css-library

Shows CSS properties used to style a card component's padding, bottom margin, border-radius, and box-shadow. This snippet illustrates how layout and spacing decisions contribute to visual rhythm and overall user experience.

```css
/* How much spacing creates good visual rhythm? */
.card {
  padding: 1.5rem; /* Why this padding? */
  margin-bottom: 2rem; /* Why this margin? */
  border-radius: 0.5rem; /* Why this radius? */
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); /* Why this shadow? */
}
```

--------------------------------

### Add daisyUI via CDN

Source: https://daisyui.com/docs/install/rails

This method allows quick addition of daisyUI without adding new files by directly importing it via CDN in the CSS file. It's recommended for simplicity and speed.

```css
@import "tailwindcss";

@import "https://cdn.jsdelivr.net/npm/daisyui@5";
```

--------------------------------

### DaisyUI Responsive Tooltip for Large Screens

Source: https://daisyui.com/components/tooltip

Implements a tooltip that is only visible on large screens and up. This example utilizes DaisyUI's responsive prefix 'lg:' to control visibility. It requires DaisyUI CSS.

```html
<div class="lg:tooltip" data-tip="hello">
  <button class="btn">Hover me</button>
</div>
```

```jsx
<div className="lg:tooltip" data-tip="hello">
  <button className="btn">Hover me</button>
</div>
```

--------------------------------

### DaisyUI Tooltip - Primary Color (HTML)

Source: https://daisyui.com/components/tooltip

This example illustrates a primary-colored tooltip with DaisyUI. The 'tooltip-primary' and 'btn-primary' classes are used to style the tooltip and button, respectively. The tooltip text is 'primary'.

```html
<div class="tooltip tooltip-open tooltip-primary" data-tip="primary">
  <button class="btn btn-primary">primary</button>
</div>
```

--------------------------------

### Basic DaisyUI Menu Example (React)

Source: https://daisyui.com/components/menu

Demonstrates a basic DaisyUI menu component in React. It utilizes the same 'menu' class structure as the HTML version for styling and layout. The 'w-56' class sets a fixed width.

```jsx
<ul className="menu bg-base-200 rounded-box w-56">
  <li><a>Item 1</a></li>
  <li><a>Item 2</a></li>
  <li><a>Item 3</a></li>
</ul>
```

--------------------------------

### Checkbox with Fieldset and Label React

Source: https://daisyui.com/components/checkbox

Provides the React implementation for a checkbox within a fieldset and label. This example uses `defaultChecked` and daisyUI classes for styling.

```jsx
<fieldset className="fieldset bg-base-100 border-base-300 rounded-box w-64 border p-4">
  <legend className="fieldset-legend">Login options</legend>
  <label className="label">
    <input type="checkbox" defaultChecked className="checkbox" />
    Remember me
  </label>
</fieldset>
```

--------------------------------

### CSS Theme Customization for daisyUI Components

Source: https://daisyui.com/pages/easy-css-library

Illustrates how to customize the appearance of daisyUI components globally by modifying CSS variables within a theme. This example shows how changing primary, secondary, and accent colors for the 'corporate' theme instantly updates all components without individual CSS overrides.

```css
/* Change your entire site's appearance */
[data-theme="corporate"] {
  --primary: #4f46e5;
  --secondary: #7c3aed;
  --accent: #f59e0b;
}

/* All components update instantly */
```

--------------------------------

### Success Color Link with DaisyUI

Source: https://daisyui.com/components/link

This snippet shows how to style a link with the success color theme using the 'link link-success' classes, with examples for both HTML and React JSX.

```html
<a class="link link-success">Click me</a>
```

```jsx
<a className="link link-success">Click me</a>
```

--------------------------------

### Initialize daisyUI with Configuration

Source: https://daisyui.com/docs/config

Demonstrates how to replace the default daisyUI plugin import with a configurable version by using brackets `{}` instead of a semicolon `;` to enclose configuration options. This allows for customization of daisyUI's behavior.

```css
@plugin "daisyui";
@plugin "daisyui" {
}
```

--------------------------------

### Fieldset with Background and Border Styling in DaisyUI

Source: https://daisyui.com/components/fieldset

Shows how to apply background, border, and rounded box styles to a DaisyUI fieldset. This example enhances the visual presentation of the fieldset container, making it stand out.

```html
<fieldset class="fieldset bg-base-200 border-base-300 rounded-box w-xs border p-4">
  <legend class="fieldset-legend">Page title</legend>
  <input type="text" class="input" placeholder="My awesome page" />
  <p class="label">You can edit page title later on from settings</p>
</fieldset>
```

```jsx
<fieldset className="fieldset bg-base-200 border-base-300 rounded-box w-xs border p-4">
  <legend className="fieldset-legend">Page title</legend>
  <input type="text" className="input" placeholder="My awesome page" />
  <p className="label">You can edit page title later on from settings</p>
</fieldset>
```

--------------------------------

### HTML Input with Label, Placeholder, and Optional Badge

Source: https://daisyui.com/components/input

This example illustrates an input field with a preceding text label ('Path'), a placeholder, and an 'Optional' badge. This pattern is useful for form inputs where some fields are not mandatory.

```html
<label class="input">
  Path
  <input type="text" class="grow" placeholder="src/app/" />
  <span class="badge badge-neutral badge-xs">Optional</span>
</label>
```

--------------------------------

### React Material-UI Component Example (JavaScript)

Source: https://daisyui.com/pages/css-library-for-html

Shows how to use Material-UI components within a React application. It includes importing `Button`, `Card`, and `TextField` from `@mui/material` and using them to construct a simple form. This highlights framework lock-in.

```javascript
// Material-UI (React only)
import { Button, Card, TextField } from '@mui/material';

function MyComponent() {
  return (
    <Card>
      <TextField label="Email" />
      <Button variant="contained">Submit</Button>
    </Card>
  );
}
```

--------------------------------

### DaisyUI Button Join for Navigation Arrows

Source: https://daisyui.com/components/pagination

Illustrates a button join used for navigation, typically for previous and next page links. This example uses text labels within the join component.

```html
<div class="join">
  <button class="join-item btn">«</button>
  <button class="join-item btn">Page 22</button>
  <button class="join-item btn">»</button>
</div>
```

```jsx
<div className="join">
  <button className="join-item btn">«</button>
  <button className="join-item btn">Page 22</button>
  <button className="join-item btn">»</button>
</div>
```

--------------------------------

### Button with Loading Spinner (HTML)

Source: https://daisyui.com/components/button

Provides examples of buttons displaying a loading spinner, either as a standalone square button or alongside text. It utilizes DaisyUI's `loading` and `loading-spinner` classes within a `<span>` element.

```html
<button class="btn btn-square">
  <span class="loading loading-spinner"></span>
</button>

<button class="btn">
  <span class="loading loading-spinner"></span>
  loading
</button>
```

--------------------------------

### Configure Vite for Tailwind CSS in Qwik

Source: https://daisyui.com/docs/install/qwik

Adds the Tailwind CSS plugin to the Vite configuration file for a Qwik project. This allows Vite to process Tailwind CSS during the build and development process.

```javascript
import tailwindcss from "@tailwindcss/vite";
//...
export default defineConfig(({ command, mode }): UserConfig => {
  return {
    plugins: [tailwindcss(), qwikCity(), qwikVite(), tsconfigPaths()],
    // ...
  };
});
```

--------------------------------

### DaisyUI Mockup Code in React with Primary Color

Source: https://daisyui.com/components/mockup-code

This example demonstrates the `mockup-code` component within a React application, using `className` for styling. It applies a primary background and text color.

```jsx
<div className="mockup-code bg-primary text-primary-content w-full">
  <pre><code>can be any color!</code></pre>
</div>
```

```jsx
<div className="mockup-code bg-primary text-primary-content w-full">
  <pre><code>can be any color!</code></pre>
</div>
```

--------------------------------

### Download daisyUI JS Files

Source: https://daisyui.com/docs/install/zola

Downloads the latest bundled JavaScript files for daisyUI, including the main module and the theme module. These files are saved alongside the Tailwind CSS executable.

```bash
curl -sLo static/daisyui.mjs https://github.com/saadeghi/daisyui/releases/latest/download/daisyui.mjs
curl -sLo static/daisyui-theme.mjs https://github.com/saadeghi/daisyui/releases/latest/download/daisyui-theme.mjs
```

--------------------------------

### daisyUI Button with Component Class

Source: https://daisyui.com/blog/full-circle

This example shows the same button implemented using daisyUI's component class ('btn') and a primary color modifier ('btn-primary'). It highlights the conciseness and readability achieved by using component classes, simplifying HTML structure and development speed.

```html
<button class="btn btn-primary">Button</button>
```

--------------------------------

### Combining daisyUI Components with Tailwind CSS Utilities

Source: https://daisyui.com/pages/css-library-for-html

Shows how to integrate daisyUI's semantic components with Tailwind CSS utility classes for fine-grained control over layout and specific styling aspects. This example features a responsive card layout.

```html
<div class="card lg:card-side bg-base-100 shadow-xl">
  <figure class="lg:w-1/3">
    <img src="photo.jpg" alt="Album" class="w-full h-full object-cover" />
  </figure>
  <div class="card-body lg:w-2/3">
    <h2 class="card-title text-2xl lg:text-3xl">Card title</h2>
    <p class="opacity-70">Card description.</p>
    <div class="card-actions justify-end mt-4">
      <button class="btn btn-primary">Buy Now</button>
    </div>
  </div>
</div>
```

--------------------------------

### Indicator Bottom Start Positioning (HTML)

Source: https://daisyui.com/components/indicator

Illustrates the 'indicator-bottom' and 'indicator-start' positioning for a DaisyUI indicator. This configuration places a secondary badge indicator at the bottom and to the left of the content. It requires the DaisyUI library to be included in the project.

```html
<div class="indicator">
  <span
    class="indicator-item indicator-bottom indicator-start badge badge-secondary"
  ></span>
  <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

```jsx
<div className="indicator">
  <span
    className="indicator-item indicator-bottom indicator-start badge badge-secondary"
  ></span>
  <div className="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

--------------------------------

### Claude Code MCP Server Installation Command

Source: https://daisyui.com/blueprint

This command-line interface (CLI) command adds the daisyUI Blueprint MCP server for use with Claude Code. It configures necessary environment variables, including LICENSE, EMAIL, and an optional FIGMA API key for Figma-to-code generation.

```bash
claude mcp add daisyui-blueprint
    --env LICENSE=YOUR_LICENSE_KEY
    --env EMAIL=YOUR_EMAIL
    --env FIGMA=YOUR_FIGMA_API_KEY
    -- npx -y daisyui-blueprint@latest
```

--------------------------------

### Manual MCP Server Configuration (JSON)

Source: https://daisyui.com/blueprint

This JSON object represents the configuration for the daisyUI Blueprint MCP server, intended for manual setup in LLM tools or code editors. It defines the server type, command to run, and environment variables for license and email.

```json
"daisyui-blueprint": {
    "type": "stdio",
    "command": "npx",
    "args": ["-y", "daisyui-blueprint@latest"],
    "env": {
      "LICENSE": "",
      "EMAIL": ""
    }
  }
```

--------------------------------

### CSS Button Styling: Junior vs. Senior Developer Approaches

Source: https://daisyui.com/pages/easy-css-library

Demonstrates inconsistent button styling due to varying developer skill levels. The junior developer's approach uses basic CSS properties, while the senior developer's approach incorporates advanced techniques like gradients, transitions, and shadows for a more polished look.

```css
/* Junior developer's button */
.btn {
  background: blue;
  color: white;
  padding: 10px;
  border: none;
}

/* Senior developer's button */
.button {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 0.375rem;
  font-weight: 500;
  transition: all 0.2s ease-in-out;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.button:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}
```

--------------------------------

### DaisyUI Chat Component Syntax

Source: https://daisyui.com/llms

The DaisyUI chat component displays messages with options for placement, avatar, and color. It requires a placement class (`chat-start` or `chat-end`) and optionally accepts color classes. Avatars can be added using a nested `chat-image` div.

```html
<div class="chat {PLACEMENT}">
  <div class="chat-image"></div>
  <div class="chat-header"></div>
  <div class="chat-bubble {COLOR}">Message text</div>
  <div class="chat-footer"></div>
</div>
```

--------------------------------

### Configure Vite for Tailwind CSS

Source: https://daisyui.com/docs/install/vike

Adds the Tailwind CSS Vite plugin to the Vite configuration file (`vite.config.ts`). This enables Tailwind CSS processing within the Vite build pipeline.

```typescript
import tailwindcss from "@tailwindcss/vite";
import vike from "vike/plugin";
import { defineConfig } from "vite";

export default defineConfig({
  plugins: [tailwindcss(), vike()],
});
```

--------------------------------

### Pikaday Date Picker (HTML)

Source: https://daisyui.com/components/calendar

This example demonstrates the basic usage of the Pikaday JavaScript datepicker library with an HTML input field. It includes the CDN link for Pikaday and a simple script to initialize the date picker.

```html
<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
<input type="text" class="input pika-single" id="myDatepicker">
<script>
  var picker = new Pikaday({ field: document.getElementById('myDatepicker') });
</script>
```

--------------------------------

### HTML Button Components with daisyUI Primary, Secondary, Accent Styles

Source: https://daisyui.com/pages/easy-css-library

Demonstrates how daisyUI simplifies design decisions by providing pre-defined styles for buttons. This snippet shows primary, secondary, and accent button variations, eliminating the need for manual color and spacing choices.

```html
<!-- No color decisions needed -->
<button class="btn btn-primary">Primary Action</button>
<button class="btn btn-secondary">Secondary Action</button>
<button class="btn btn-accent">Accent Action</button>

<!-- No spacing decisions needed -->
<div class="card">
  <div class="card-body">
    <!-- Perfect spacing automatically -->
  </div>
</div>

<!-- No typography decisions needed -->
<h1 class="text-4xl font-bold">Heading</h1>
<p class="text-base">Body text with proper line height.</p>
```

--------------------------------

### Add DaisyUI llms.txt as Custom Docs in Cursor

Source: https://daisyui.com/docs/editor/cursor

This process involves adding the DaisyUI `llms.txt` URL as a custom document within Cursor via the command palette. Once added, you can invoke DaisyUI docs using the `@docs` command followed by `daisyUI`.

```plaintext
https://daisyui.com/llms.txt
```

--------------------------------

### Configure Tailwind CSS and daisyUI (npm/mjs)

Source: https://daisyui.com/docs/install/rails

Configuration for Tailwind CSS and daisyUI in `application.css`. It shows how to import Tailwind CSS and daisyUI as a plugin, with an option for custom themes when using mjs files.

```css
@import "tailwindcss";
@plugin "daisyui";
```

```css
@import "tailwindcss";

@source not "./daisyui{*}.mjs";

@plugin "./daisyui.mjs";

/* Optional for custom themes – Docs: https://daisyui.com/docs/themes/#how-to-add-a-new-custom-theme */
@plugin "./daisyui-theme.mjs"{
  /* custom theme here */
}
```

--------------------------------

### CSS Styling for Primary Button Component

Source: https://daisyui.com/pages/ui-library-for-hackaton

Demonstrates the CSS complexity required to style a single button variant with hover and active states. This example illustrates the time-consuming nature of creating design systems from scratch, showing gradient backgrounds, shadows, transitions, and state-based transformations that must be repeated for each component variant.

```css
.primary-button {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border: none;
  border-radius: 8px;
  padding: 12px 24px;
  color: white;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
  box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
}
.primary-button:hover {
  transform: translateY(-1px);
  box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
}
.primary-button:active {
  transform: translateY(0);
}
```

--------------------------------

### Update Input Component Styling

Source: https://daisyui.com/docs/upgrade

Illustrates changes to the Input component, including default width and border handling. The `input-bordered` class is removed as borders are now default, and `input-ghost` is used to remove them.

```html
<!-- Input with border -->
<input class="input input-bordered"/>

<!-- Input without border -->
<input class="input"/>

<!-- Input with 20rem width -->
<input class="input w-full max-w-xs"/>
```

```html
<!-- Input with border -->
<input class="input"/>

<!-- Input without border -->
<input class="input input-ghost"/>

<!-- Input with consistent width -->
<input class="input"/>
```

--------------------------------

### Phone Mockup with Color and Wallpaper (HTML)

Source: https://daisyui.com/components/mockup-phone

This example illustrates how to add a custom border color and a background image to the phone mockup using DaisyUI. The `border-[#ff8938]` class sets the border color, and an `<img>` tag within the display area shows the wallpaper. This allows for more visually appealing mockups.

```html
<div class="mockup-phone border-[#ff8938]">
  <div class="mockup-phone-camera"></div>
  <div class="mockup-phone-display">
    <img alt="wallpaper" src="https://img.daisyui.com/images/stock/453966.webp" />
  </div>
</div>
```

--------------------------------

### DaisyUI Outline Style Badges (React)

Source: https://daisyui.com/components/badge

Provides examples of outline-styled badges in a React component using DaisyUI classes. The 'className' attribute is used for applying styles.

```jsx
<div className="badge badge-outline badge-primary">Primary</div>
<div className="badge badge-outline badge-secondary">Secondary</div>
<div className="badge badge-outline badge-accent">Accent</div>
<div className="badge badge-outline badge-info">Info</div>
<div className="badge badge-outline badge-success">Success</div>
<div className="badge badge-outline badge-warning">Warning</div>
<div className="badge badge-outline badge-error">Error</div>
```

--------------------------------

### Configure daisyUI Blueprint MCP Server in VSCode

Source: https://daisyui.com/docs/editor/vscode

This JSON configuration adds the 'daisyui-blueprint' MCP server to your VSCode settings. It specifies the server type, command to run, arguments, and environment variables including your license key, email, and an optional Figma API key.

```json
{
  "servers": {
    "daisyui-blueprint": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "daisyui-blueprint@latest"],
      "env": {
        "LICENSE": "YOUR BLUEPRINT LICENSE KEY",
        "EMAIL": "YOUR EMAIL ADDRESS",
        "FIGMA": "YOUR FIGMA API KEY (optional)"
      }
    }
  }
}
```

--------------------------------

### Import Ember CSS in index.html

Source: https://daisyui.com/docs/install/ember

Configures the `index.html` file within an Ember project to import the main CSS file, which now includes Tailwind CSS and daisyUI. This ensures that the styles are loaded correctly when the application runs.

```html
<head>
+  <script type="module">
+    import "./app/styles.css";
+  </script>
  <!-- the rest -->
</head>
```

--------------------------------

### Update Footer Layout

Source: https://daisyui.com/docs/upgrade

Demonstrates the change in the default footer layout. It is now vertical by default, and the `footer-horizontal` class can be applied for horizontal layout at specific screen sizes.

```html
<footer class="footer">
  <!-- ... -->
</footer>
```

```html
<footer class="footer md:footer-horizontal">
  <!-- ... -->
</footer>
```

--------------------------------

### Status Indicator Example (React JSX)

Source: https://daisyui.com/components/indicator

Illustrates the implementation of a DaisyUI status indicator within a React application using JSX. This pattern is commonly used for notifications or availability markers.

```jsx
<div className="indicator">
  <span className="indicator-item status status-success"></span>
  <div className="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

--------------------------------

### Steps Component for Process Indicators

Source: https://daisyui.com/llms

Component for displaying a sequential list of steps in a process with optional vertical or horizontal direction. Supports color modifiers, step icons, and data-content attributes for displaying custom values.

```html
<ul class="steps {MODIFIER}">
  <li class="step">{step content}</li>
</ul>
```

--------------------------------

### Using daisyUI Color Utility Classes

Source: https://daisyui.com/docs/utilities

Demonstrates how to apply daisyUI's color utility classes to set background and text colors. These classes work similarly to Tailwind CSS color utilities. The example shows setting a primary background and a contrasting content color.

```html
<div class="bg-primary text-primary-content">Primary color</div>
```

```html
<div class="bg-primary text-primary-content/60">Primary-content color with 60% opacity</div>
```

--------------------------------

### DaisyUI Form Elements: Toggles, Checkboxes, and Radios

Source: https://daisyui.com/codepen

Demonstrates the usage of toggle switches, checkboxes, and radio buttons with different color variants provided by DaisyUI. These examples show basic HTML structure for form inputs with custom styling classes.

```html
<input type="checkbox" class="toggle toggle-primary" />
<input type="checkbox" class="toggle toggle-secondary" />
<input type="checkbox" class="toggle toggle-accent" />
<br/>
<input type="checkbox" class="checkbox" />
<input type="checkbox" class="checkbox-primary checkbox" />
<input type="checkbox" class="checkbox-secondary checkbox" />
<input type="checkbox" class="checkbox-accent checkbox" />
<br/>
<input type="radio" name="radio" class="radio" />
<input type="radio" name="radio" class="radio-primary radio" />
<input type="radio" name="radio" class="radio-secondary radio" />
<input type="radio" name="radio" class="radio-accent radio" />
```

--------------------------------

### Make Tailwind CSS Executable (Linux/macOS)

Source: https://daisyui.com/docs/install/zola

Grants execute permissions to the downloaded Tailwind CSS binary file. This command is essential for running the Tailwind CSS compiler on Linux and macOS systems.

```bash
chmod +x static/tailwindcss
```

--------------------------------

### Add daisyUI to CSS

Source: https://daisyui.com/docs/upgrade

Import daisyUI into your main CSS file. You can either use a basic import or specify built-in themes directly within the import statement for immediate theme activation.

```css
@import "tailwindcss";
@plugin "daisyui";
```

```css
@import "tailwindcss";
@plugin "daisyui" {
  themes: light --default, dark --prefersdark, cupcake;
}
```

--------------------------------

### Dynamic Tailwind CSS Class Names Example

Source: https://daisyui.com/blog/most-common-mistake-when-using-tailwind-css

Demonstrates the incorrect use of dynamic class names in HTML with Tailwind CSS, which fails during production builds.

```html
<div class="bg-red-500"></div>
<div class="bg-green-500"></div>
<div class="bg-blue-500"></div>

<div class="bg-{{ color }}-500"></div>
<div class="btn btn-{{ type }}"></div>
```

--------------------------------

### Basic daisyUI Skeleton Component

Source: https://daisyui.com/components/skeleton

This snippet demonstrates the basic usage of the daisyUI Skeleton component to create a simple loading placeholder. It requires the daisyUI CSS framework. The output is a div with a loading animation.

```html
<div class="skeleton h-32 w-32"></div>
```

```jsx
<div className="skeleton h-32 w-32"></div>
```

--------------------------------

### HTML File Size Explosion with Tailwind CSS

Source: https://daisyui.com/pages/tailwind-css-alternative

Shows an example of repetitive utility classes in HTML, leading to bloated file sizes and reduced readability. This demonstrates how common classes are repeated across elements.

```html
<div class="flex flex-col space-y-4 p-6 bg-white rounded-lg shadow-lg">
  <div class="flex items-center space-x-3">
    <div class="flex-shrink-0 w-10 h-10 bg-gray-300 rounded-full"></div>
    <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-gray-900 truncate">Username</p>
      <p class="text-sm text-gray-500 truncate">user@example.com</p>
    </div>
  </div>
  <div class="flex items-center space-x-3">
    <div class="flex-shrink-0 w-10 h-10 bg-gray-300 rounded-full"></div>
    <div class="flex-1 min-w-0">
      <p class="text-sm font-medium text-gray-900 truncate">Another User</p>
      <p class="text-sm text-gray-500 truncate">another@example.com</p>
    </div>
  </div>
</div>
```

--------------------------------

### Customizing daisyUI Button with Utility Classes

Source: https://daisyui.com/blog/full-circle

This example illustrates how daisyUI components can be easily customized by combining component classes with Tailwind CSS utility classes. It demonstrates adding size, background color, padding, and rounded corners to a daisyUI button, showing the seamless integration of both approaches.

```html
<button class="btn btn-primary rounded-xl bg-blue-500 px-8">Custom Button</button>
```

--------------------------------

### Indicator for Button Example (HTML)

Source: https://daisyui.com/components/indicator

Demonstrates attaching a numerical badge indicator to a button, commonly used for displaying counts like unread messages in an inbox. The `indicator-item` class is applied to the badge.

```html
<div class="indicator">
  <span class="indicator-item badge badge-secondary">12</span>
  <button class="btn">inbox</button>
</div>
```

--------------------------------

### DaisyUI Toggle and Checkbox/Radio Inputs (HTML)

Source: https://daisyui.com/tailwindplay

Shows how to implement toggle switches and standard checkboxes/radio buttons using DaisyUI's 'toggle' class. It includes examples of default toggles and themed toggles with the 'toggle-primary' class.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DaisyUI Toggles</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.1.17/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<!-- toggle, checkbox, radio -->
<div class="p-4">
<input type="checkbox" class="toggle" />
<input type="checkbox" class="toggle toggle-primary" />
</div>

</body>
</html>
```

--------------------------------

### Update Bottom Navigation to Dock Component

Source: https://daisyui.com/docs/upgrade

Replaces the deprecated `bottom-nav` component with the `dock` component for a more modern and accessible navigation pattern. This includes updating size variants and active states.

```html
<div class="btm-nav btm-nav-sm">
  <button>🏠</button>
  <button class="active">🍿</button>
  <button>⚙️</button>
</div>
```

```html
<div class="dock dock-sm">
  <button>🏠</button>
  <button class="dock-active">🍿</button>
  <button>⚙️</button>
</div>
```

--------------------------------

### Indicator for Tab Example (HTML)

Source: https://daisyui.com/components/indicator

Illustrates how to integrate a badge indicator within a tab component to show counts for specific tabs, like notifications. This uses the `indicator` and `indicator-item` classes on a tab element.

```html
<div class="tabs tabs-lift">
  <a class="tab">Messages</a>
  <a class="indicator tab tab-active">
    Notifications
    <span class="indicator-item badge">8</span>
  </a>
  <a class="tab">Requests</a>
</div>
```

--------------------------------

### Update Stats Background Color

Source: https://daisyui.com/docs/upgrade

Informs that the background color of the `stats` component is now transparent by default. Use `bg-base-100` or other background utility classes if a solid background is desired.

```html
<!-- Example assuming a previous version with a default background -->
<div class="stats">
  <div class="stat">
    <div class="stat-title">Total Page Views</div>
    <div class="stat-value">89,400</div>
  </div>
</div>

<!-- To add a background -->
<div class="stats bg-base-100">
  <div class="stat">
    <div class="stat-title">Total Page Views</div>
    <div class="stat-value">89,400</div>
  </div>
</div>
```

--------------------------------

### DaisyUI Navbar with Title and Icon (HTML)

Source: https://daisyui.com/components/navbar

An HTML example of a DaisyUI Navbar featuring a title and an icon button. It uses 'navbar-start' and 'navbar-end' implicitly through flexbox classes ('flex-1', 'flex-none') for layout. Includes SVG for the icon.

```html
<div class="navbar bg-base-100 shadow-sm">
  <div class="flex-1">
    <a class="btn btn-ghost text-xl">daisyUI</a>
  </div>
  <div class="flex-none">
    <button class="btn btn-square btn-ghost">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block h-5 w-5 stroke-current"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path> </svg>
    </button>
  </div>
</div>
```

--------------------------------

### Create Simple Button Component with daisyUI

Source: https://daisyui.com/pages/easy-component-library

Demonstrates the basic syntax for creating a button using daisyUI's simple class naming convention. The btn class provides all necessary button styling without writing custom CSS. This exemplifies daisyUI's focus on readable, semantic HTML.

```html
<button class="btn">Click Me</button>
```

--------------------------------

### Configure Vite for Tailwind CSS

Source: https://daisyui.com/docs/install/vue

Configures the Vite build tool to use Tailwind CSS. This involves importing the tailwindcss plugin and adding it to the Vite configuration's plugins array.

```javascript
import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";
import vue from "@vitejs/plugin-vue";

export default defineConfig({
  plugins: [tailwindcss(), vue()],
});
```

--------------------------------

### Radio Button Component Syntax

Source: https://daisyui.com/llms

Demonstrates the basic HTML structure for a DaisyUI radio button. The 'radio' class is applied to an input element, with optional color and size modifiers. Ensure unique 'name' attributes for radio groups.

```html
<input type="radio" name="{name}" class="radio {MODIFIER}" />
```

--------------------------------

### Accent Color Link with DaisyUI

Source: https://daisyui.com/components/link

This code illustrates how to apply the accent color to a DaisyUI link by utilizing the 'link link-accent' classes. Examples are provided for both HTML and React JSX.

```html
<a class="link link-accent">Click me</a>
```

```jsx
<a className="link link-accent">Click me</a>
```

--------------------------------

### Unordered List Styling with daisyUI and Tailwind CSS Typography

Source: https://daisyui.com/docs/layout-and-typography

Presents examples of unordered lists (bullet points) and nested unordered lists, styled by daisyUI and Tailwind CSS Typography for organized information presentation.

```html
<ul>
  <li>First item</li>
  <li>Second item</li>
  <ul>
    <li>Subitem one</li>
    <li>Subitem two</li>
  </ul>
</ul>
```

--------------------------------

### DaisyUI Join: Search Input and Filter Select

Source: https://daisyui.com/components/join

Demonstrates a search bar with an input field and a dropdown filter, all joined together using DaisyUI's join classes. This example shows how elements nested within the join group still inherit the styling.

```html
<div class="join">
  <div>
    <div>
      <input class="input join-item" placeholder="Search" />
    </div>
  </div>
  <select class="select join-item">
    <option disabled selected>Filter</option>
    <option>Sci-fi</option>
    <option>Drama</option>
    <option>Action</option>
  </select>
  <div class="indicator">
    <span class="indicator-item badge badge-secondary">new</span>
    <button class="btn join-item">Search</button>
  </div>
</div>
```

```jsx
<div className="join">
  <div>
    <div>
      <input className="input join-item" placeholder="Search" />
    </div>
  </div>
  <select className="select join-item">
    <option disabled selected>Filter</option>
    <option>Sci-fi</option>
    <option>Drama</option>
    <option>Action</option>
  </select>
  <div className="indicator">
    <span className="indicator-item badge badge-secondary">new</span>
    <button className="btn join-item">Search</button>
  </div>
</div>
```

--------------------------------

### daisyUI Skeleton with Circle Content

Source: https://daisyui.com/components/skeleton

This example shows how to use daisyUI Skeleton to create a loading state for a profile picture and associated text. It requires daisyUI CSS. The output displays a rounded placeholder for an image and placeholders for text, arranged in a column.

```html
<div class="flex w-52 flex-col gap-4">
  <div class="flex items-center gap-4">
    <div class="skeleton h-16 w-16 shrink-0 rounded-full"></div>
    <div class="flex flex-col gap-4">
      <div class="skeleton h-4 w-20"></div>
      <div class="skeleton h-4 w-28"></div>
    </div>
  </div>
  <div class="skeleton h-32 w-full"></div>
</div>
```

```jsx
<div className="flex w-52 flex-col gap-4">
  <div className="flex items-center gap-4">
    <div className="skeleton h-16 w-16 shrink-0 rounded-full"></div>
    <div className="flex flex-col gap-4">
      <div className="skeleton h-4 w-20"></div>
      <div className="skeleton h-4 w-28"></div>
    </div>
  </div>
  <div className="skeleton h-32 w-full"></div>
</div>
```

--------------------------------

### Update Avatar Status Classes

Source: https://daisyui.com/docs/upgrade

In daisyUI 5, avatar status classes have been renamed for better clarity. The `online` class is now `avatar-online`, `offline` is `avatar-offline`, and `placeholder` is `avatar-placeholder`.

```html
- <div class="avatar online">
+ <div class="avatar avatar-online">
  <div class="w-24 rounded-full">
    <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
  </div>
</div>
```

```html
- <div class="avatar offline">
+ <div class="avatar avatar-offline">
  <div class="w-24 rounded-full">
    <img src="https://img.daisyui.com/images/stock/photo-1534528741775-53994a69daeb.webp" />
  </div>
</div>
```

--------------------------------

### Horizontal Divider with Text (HTML)

Source: https://daisyui.com/components/divider

Illustrates a horizontal divider used to separate elements arranged side-by-side. This example requires the 'divider-horizontal' class and uses flexbox for layout.

```html
<div class="flex w-full">
  <div class="card bg-base-300 rounded-box grid h-20 grow place-items-center">content</div>
  <div class="divider divider-horizontal">OR</div>
  <div class="card bg-base-300 rounded-box grid h-20 grow place-items-center">content</div>
</div>
```

```jsx
<div className="flex w-full">
  <div className="card bg-base-300 rounded-box grid h-20 grow place-items-center">content</div>
  <div className="divider divider-horizontal">OR</div>
  <div className="card bg-base-300 rounded-box grid h-20 grow place-items-center">content</div>
</div>
```

--------------------------------

### Configure Vite with Tailwind CSS and React plugins

Source: https://daisyui.com/docs/install/react

Update the Vite configuration file to include Tailwind CSS and React plugins. This enables Tailwind CSS processing and React JSX transformation during the build process.

```javascript
import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [tailwindcss(), react()],
});
```

--------------------------------

### HTML Collapsible Submenu Example

Source: https://daisyui.com/components/menu

Demonstrates a nested, collapsible submenu structure using DaisyUI's menu classes and native HTML 'details' and 'summary' elements. This provides an accessible, interactive menu without JavaScript.

```html
<ul class="menu bg-base-200 rounded-box w-56">
  <li><a>Item 1</a></li>
  <li>
    <details open>
      <summary>Parent</summary>
      <ul>
        <li><a>Submenu 1</a></li>
        <li><a>Submenu 2</a></li>
        <li>
          <details open>
            <summary>Parent</summary>
            <ul>
              <li><a>Submenu 1</a></li>
              <li><a>Submenu 2</a></li>
            </ul>
          </details>
        </li>
      </ul>
    </details>
  </li>
  <li><a>Item 3</a></li>
</ul>
```

```jsx
<ul className="menu bg-base-200 rounded-box w-56">
  <li><a>Item 1</a></li>
  <li>
    <details open>
      <summary>Parent</summary>
      <ul>
        <li><a>Submenu 1</a></li>
        <li><a>Submenu 2</a></li>
        <li>
          <details open>
            <summary>Parent</summary>
            <ul>
              <li><a>Submenu 1</a></li>
              <li><a>Submenu 2</a></li>
            </ul>
          </details>
        </li>
      </ul>
    </details>
  </li>
  <li><a>Item 3</a></li>
</ul>
```

--------------------------------

### HTML Input with Icons and Keyboard Shortcuts

Source: https://daisyui.com/components/input

This example shows how to create a search input with an integrated search icon and keyboard shortcut hints (⌘K). It uses the 'input' class for the parent container and 'kbd' for the shortcut keys. The SVG icon is also embedded directly.

```html
<label class="input">
  <svg class="h-[1em] opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
    <g
      stroke-linejoin="round"
      stroke-linecap="round"
      stroke-width="2.5"
      fill="none"
      stroke="currentColor"
    >
      <circle cx="11" cy="11" r="8"></circle>
      <path d="m21 21-4.3-4.3"></path>
    </g>
  </svg>
  <input type="search" class="grow" placeholder="Search" />
  <kbd class="kbd kbd-sm">⌘</kbd>
  <kbd class="kbd kbd-sm">K</kbd>
</label>
```

--------------------------------

### Create Theme Controller with Checkbox or Radio Input

Source: https://daisyui.com/llms

Switch page themes dynamically using a checked checkbox or radio input with theme-controller class. The page theme matches the input's value attribute, which must be a valid DaisyUI theme name.

```html
<input type="checkbox" value="{theme-name}" class="theme-controller" />
```

--------------------------------

### Update Select Component Styling

Source: https://daisyui.com/docs/upgrade

Illustrates changes to the Select component, similar to the Input component. It now has a default width and border. The `select-ghost` class is used to remove the default border.

```html
<!-- Select with border -->
<select class="select select-bordered">

<!-- Select without border -->
<select class="select">

<!-- Select with consistent width -->
<select class="select w-full max-w-xs">

```

```html
<!-- Select with border -->
<select class="select">

<!-- Select without border -->
<select class="select select-ghost">

<!-- Select with consistent width -->
<select class="select">

```

--------------------------------

### Badge Styles Component in HTML

Source: https://daisyui.com/components/badge

Provides examples of different badge styling options, including 'badge-outline', 'badge-dash', 'badge-soft', and 'badge-ghost'. These classes modify the visual appearance of the badge border and background.

```html
<span class="badge badge-outline">Outline</span>
<span class="badge badge-dash">Dash</span>
<span class="badge badge-soft">Soft</span>
<span class="badge badge-ghost">Ghost</span>
```

--------------------------------

### Add daisyUI plugin to Tailwind CSS

Source: https://daisyui.com/docs/install/waku

This snippet shows how to integrate daisyUI into the project's main CSS file by adding the daisyUI plugin to the Tailwind CSS import. This step is crucial for enabling daisyUI's components and utility classes.

```css
@import "tailwindcss";
+@plugin "daisyui";
```

--------------------------------

### DaisyUI Modal Structure (HTML)

Source: https://daisyui.com/tailwindplay

Presents a basic structure for a modal dialog using DaisyUI components. It includes a button to trigger the modal and the modal's content area with a close button and example steps.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DaisyUI Modal</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.1.17/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<!-- Button to open modal -->
<label for="my_modal_1" class="btn">open modal</label>

<!-- Put this part before </body> tag -->
<input type="checkbox" id="my_modal_1" class="modal-toggle" />
<div class="modal">
  <div class="modal-box">
    <h3 class="font-bold text-lg">Press ESC key or click the button below to close</h3>
    <p class="py-4">This is a modal example with steps:</p>
    <ul class="steps steps-vertical">
      <li class="step">Register</li>
      <li class="step step-neutral">Choose plan</li>
      <li class="step step-neutral">Purchase</li>
      <li class="step step-neutral">Receive Product</li>
    </ul>
    <div class="modal-action">
      <label for="my_modal_1" class="btn">Close</label>
    </div>
  </div>
</div>

</body>
</html>
```

--------------------------------

### Range Slider with Steps and Measures (HTML)

Source: https://daisyui.com/components/range

A range slider configured with steps and visual measurement markers. This example uses additional divs to display the step values and divider lines.

```html
<div class="w-full max-w-xs">
  <input type="range" min="0" max="100" value="25" class="range" step="25" />
  <div class="flex justify-between px-2.5 mt-2 text-xs">
    <span>|</span>
    <span>|</span>
    <span>|</span>
    <span>|</span>
    <span>|</span>
  </div>
  <div class="flex justify-between px-2.5 mt-2 text-xs">
    <span>1</span>
    <span>2</span>
    <span>3</span>
    <span>4</span>
    <span>5</span>
  </div>
</div>
```

--------------------------------

### Basic DaisyUI Radio Button Implementation (HTML)

Source: https://daisyui.com/components/radio

Demonstrates the basic structure for creating radio buttons using DaisyUI classes. Each set of radio inputs must have a unique 'name' attribute. This example uses the 'radio' class for styling and 'checked' attribute to indicate a default selection.

```html
<input type="radio" name="radio-1" class="radio" checked="checked" />
<input type="radio" name="radio-1" class="radio" />
```

--------------------------------

### DaisyUI Hero Component

Source: https://daisyui.com/llms

The hero component provides a large, prominent area for displaying key content like titles and descriptions, often used on landing pages. It can include background images and overlays for emphasis. The 'hero-content' class is used for text elements, and 'hero-overlay' can be applied for color overlays.

```html
<div class="hero min-h-screen" style="background-image: url(https://img.daisyui.com/images/stock/photo-1507358522786-5576f8843bad.jpg);">
  <div class="hero-overlay bg-opacity-60"></div>
  <div class="hero-content text-center text-neutral-content">
    <div class="max-w-md">
      <h1 class="mb-5 text-5xl font-bold">Hello there</h1>
      <p class="mb-5">Provident cupiditate voluptatem et in. Quaerat fugiat ut assumenda excepturi exercitationem quasi. In deleniti eaque aut repudiandae et a id nisi.</p>
      <button class="btn btn-primary">Get Started</button>
    </div>
  </div>
</div>
```

--------------------------------

### JSX Input with Icons and Keyboard Shortcuts

Source: https://daisyui.com/components/input

This is the JSX equivalent of the HTML search input example. It uses 'className' instead of 'class' for CSS classes and demonstrates the same styling for icons and keyboard shortcuts within an input group.

```jsx
<label className="input">
  <svg className="h-[1em] opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
    <g
      strokeLinejoin="round"
      strokeLinecap="round"
      strokeWidth="2.5"
      fill="none"
      stroke="currentColor"
    >
      <circle cx="11" cy="11" r="8"></circle>
      <path d="m21 21-4.3-4.3"></path>
    </g>
  </svg>
  <input type="search" className="grow" placeholder="Search" />
  <kbd className="kbd kbd-sm">⌘</kbd>
  <kbd className="kbd kbd-sm">K</kbd>
</label>
```

--------------------------------

### Element Masking with DaisyUI

Source: https://daisyui.com/llms

Crops content into common shapes such as squircle, heart, hexagon, or circle. Requires a mask style class and can be combined with modifier classes for half shapes.

```html
<img class="mask mask-squircle" src="{image-url}" />
<img class="mask mask-heart" src="{image-url}" />
<img class="mask mask-hexagon-2 mask-half-1" src="{image-url}" />
```

--------------------------------

### React Material-UI Component Example

Source: https://daisyui.com/pages/best-component-library-for-2026

This React code snippet shows how to use components from the Material-UI library. It highlights framework lock-in, as these components are specific to React and would require a complete rewrite if migrating to a different framework like Vue or Svelte.

```javascript
// Material-UI (React only)
import { Button, Card, TextField } from '@mui/material';

function MyComponent() {
  return (
    <Card>
      <TextField label="Email" variant="outlined" />
      <Button variant="contained" color="primary">Submit</Button>
    </Card>
  );
}
```

--------------------------------

### HTML and Tailwind CSS Feature Styling

Source: https://daisyui.com/pages/easy-css-library

Contrasts the minimal time required for functional code implementation with the extensive time needed for styling using HTML and Tailwind CSS. This illustrates the productivity impact of complex styling requirements.

```html
<!-- The functionality: 5 minutes -->
<form onSubmit={handleSubmit}>
  <input name="email" type="email" />
  <button type="submit">Subscribe</button>
</form>

<!-- The styling: 2 hours -->
<form className="bg-white p-8 rounded-lg shadow-lg max-w-md mx-auto">
  <div className="mb-6">
    <label className="block text-gray-700 text-sm font-bold mb-2">
      Email Address
    </label>
    <input 
      className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline focus:border-blue-500 transition duration-200"
      name="email" 
      type="email" 
    />
  </div>
  <button 
    className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline transition duration-200 w-full"
    type="submit"
  >
    Subscribe
  </button>
</form>
```

--------------------------------

### JSX Input with File Icon and Placeholder

Source: https://daisyui.com/components/input

This JSX code demonstrates a file-like input field, mirroring the HTML example. It includes an SVG file icon and a placeholder for the input value, suitable for contexts like file paths.

```jsx
<label className="input">
  <svg className="h-[1em] opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
    <g
      strokeLinejoin="round"
      strokeLinecap="round"
      strokeWidth="2.5"
      fill="none"
      stroke="currentColor"
    >
      <path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z"></path>
      <path d="M14 2v4a2 2 0 0 0 2 2h4"></path>
    </g>
  </svg>
  <input type="text" className="grow" placeholder="index.php" />
</label>
```

--------------------------------

### DaisyUI Disabled Toggles (React)

Source: https://daisyui.com/components/toggle

Demonstrates disabling DaisyUI toggle components in a React environment using the 'disabled' prop. Examples include both disabled and checked disabled states.

```jsx
<input type="checkbox" className="toggle" disabled />
<input type="checkbox" className="toggle" disabled defaultChecked />
```

--------------------------------

### DaisyUI Indeterminate Progress Bar Examples

Source: https://daisyui.com/components/progress

Shows how to create an indeterminate progress bar in DaisyUI, which is used when the progress cannot be determined. This variant does not require a 'value' attribute. It simply displays a continuous loading animation.

```html
<progress class="progress w-56"></progress>
```

```jsx
<progress className="progress w-56"></progress>
```

--------------------------------

### Radix UI React Component Example with Framework Lock-in

Source: https://daisyui.com/pages/scalable-component-library

Demonstrates a React-based component implementation using Radix UI that only works within React framework context. Shows typical usage of Radix UI Button, Card, and TextField components that cannot be reused in other frameworks like Vue or vanilla JavaScript, illustrating the framework lock-in problem at scale.

```javascript
// Radix UI components only work in React
import { Button } from '@radix-ui/themes';
import { Card } from '@radix-ui/themes';
import { TextField } from '@radix-ui/themes';

function UserForm() {
  return (
    <Card>
      <TextField placeholder="Email" />
      <Button>Submit</Button>
    </Card>
  );
}
```

--------------------------------

### Add Tailwind CSS Import to CSS File

Source: https://daisyui.com/pages/install-tailwind-css-vite

Adds the Tailwind CSS import statement to the main CSS file (e.g., src/style.css). This enables Tailwind's utility classes.

```css
@import "tailwindcss";
```

--------------------------------

### Create a Dropdown Menu with Headless UI (React)

Source: https://daisyui.com/blog/how-to-use-headless-ui-and-daisyui

Demonstrates the basic structure of a dropdown menu component using Headless UI for React. It shows how to import and use Menu, Menu.Button, and Menu.Items.

```jsx
import { Menu } from "@headlessui/react"

export default function MyDropDown() {
  return (
    <Menu>
      <Menu.Button>Button</Menu.Button>
      <Menu.Items>
        <Menu.Item>
          <li>
            <a href="/link">Item 1</a>
          </li>
        </Menu.Item>
        <Menu.Item>
          <li>
            <a href="/link">Item 2</a>
          </li>
        </Menu.Item>
      </Menu.Items>
    </Menu>
  )
}
```

--------------------------------

### Refactor Complex Form Labels with Fieldset in HTML

Source: https://daisyui.com/docs/upgrade

Convert form-control structures with multiple label-text and label-text-alt elements to fieldset with flex layout labels for better semantic markup and maintainability.

```html
before
<label class="form-control w-full max-w-xs">
  <div class="label">
    <span class="label-text">What is your name?</span>
    <span class="label-text-alt">Top Right label</span>
  </div>
  <input type="text" placeholder="Type here" class="input input-bordered w-full max-w-xs" />
  <div class="label">
    <span class="label-text-alt">Bottom Left label</span>
    <span class="label-text-alt">Bottom Right label</span>
  </div>
</label>

after
<fieldset class="fieldset max-w-xs">
  <label class="label flex justify-between" for="name">
    <span>What is your name?</span>
    <span>Top Right label</span>
  </label>
  <input id="name" class="input" placeholder="Name" />
  <label class="label flex justify-between" for="name">
    <span>Bottom Left label</span>
    <span>Bottom Right label</span>
  </label>
</fieldset>
```

--------------------------------

### Configure daisyUI Plugin in Tailwind Config

Source: https://daisyui.com/blog/9-best-tailwind-css-plugins-for-developers

Add daisyUI to the plugins array in your tailwind.config.js file to enable the daisyUI component library. This configuration file is the main entry point for Tailwind CSS customization and plugin setup.

```javascript
module.exports = {
  plugins: [require("daisyui")],
}
```

--------------------------------

### Update Menu Item Classes

Source: https://daisyui.com/docs/upgrade

Shows the renaming of classes for menu items to improve clarity and consistency. `disabled`, `active`, and `focus` classes are renamed to `menu-disabled`, `menu-active`, and `menu-focus` respectively.

```html
<ul class="menu">
  <li class="disabled"><a>disabled item</a></li>
  <li class="active"><a>active item</a></li>
  <li class="focus"><a>focus item</a></li>
</ul>
```

```html
<ul class="menu w-full">
  <li class="menu-disabled"><a>disabled item</a></li>
  <li class="menu-active"><a>active item</a></li>
  <li class="menu-focus"><a>focus item</a></li>
</ul>
```

--------------------------------

### Tailwind CSS Button Example

Source: https://daisyui.com/pages/tailwind-css

Demonstrates a basic button styled using Tailwind CSS utility classes. This showcases the direct application of utility classes in HTML for styling elements, requiring no external CSS files.

```html
<button class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">Click Me</button>
```

--------------------------------

### HTML Carousel Snap to Center with DaisyUI

Source: https://daisyui.com/components/carousel

This HTML snippet shows how to create a carousel that centers its items using DaisyUI's 'carousel-center' class. It requires no external JavaScript dependencies for basic functionality.

```html
<div class="carousel carousel-center rounded-box">
  <div class="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp" alt="Pizza" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      alt="Pizza" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      alt="Pizza" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      alt="Pizza" />
  </div>
  <div class="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp" alt="Pizza" />
  </div>
  <div class="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp" alt="Pizza" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      alt="Pizza" />
  </div>
</div>
```

--------------------------------

### DaisyUI Collapse Component Syntax

Source: https://daisyui.com/llms

The DaisyUI collapse component is used for showing and hiding content. It features `collapse-title` and `collapse-content` parts and can be modified with classes like `collapse-arrow` or `collapse-plus`. An alternative to `tabindex="0"` is using an `<input type="checkbox">` as the first child.

```html
<div tabindex="0" class="collapse {MODIFIER}">
  <div class="collapse-title">{title}</div>
  <div class="collapse-content">{CONTENT}</div>
</div>
```

--------------------------------

### DaisyUI Tooltip - Primary Color (React JSX)

Source: https://daisyui.com/components/tooltip

This example illustrates a primary-colored tooltip using DaisyUI in React JSX. It applies 'tooltip-primary' and 'btn-primary' classes for styling. The tooltip text is 'primary'.

```jsx
<div className="tooltip tooltip-open tooltip-primary" data-tip="primary">
  <button className="btn btn-primary">primary</button>
</div>
```

--------------------------------

### DaisyUI List Item Structure

Source: https://daisyui.com/components/list

This snippet shows a basic list item structure used in DaisyUI examples, typically containing an image, text content, and action buttons. It's a common pattern for displaying user-related or content-related information.

```html
<li class="list-row">
    <div><img class="size-10 rounded-box" src="https://img.daisyui.com/images/profile/demo/4@94.webp"/></div>
    <div>
      <div>Ellie Beilish</div>
      <div class="text-xs uppercase font-semibold opacity-60">Bears of a fever</div>
    </div>
    <p class="list-col-wrap text-xs">
      "Bears of a Fever" captivated audiences with its intense energy and mysterious lyrics. Its popularity skyrocketed after fans shared it widely online, earning Ellie critical acclaim.
    </p>
    <button class="btn btn-square btn-ghost">
      <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g strokeLinejoin="round" strokeLinecap="round" strokeWidth="2" fill="none" stroke="currentColor"><path d="M6 3L20 12 6 21 6 3z"></path></g></svg>
    </button>
    <button class="btn btn-square btn-ghost">
      <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g strokeLinejoin="round" strokeLinecap="round" strokeWidth="2" fill="none" stroke="currentColor"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path></g></svg>
    </button>
  </li>
```

--------------------------------

### Basic DaisyUI Avatar Component Example

Source: https://daisyui.com/components/avatar

This snippet shows the basic structure for creating an avatar component using DaisyUI. It requires a parent div with the class 'avatar' and a nested div with a specified width and 'rounded' class, containing an image element.

```html
<div class="avatar">
  <div class="w-24 rounded">
    <img src="https://img.daisyui.com/images/profile/demo/batperson@192.webp" />
  </div>
</div>
```

```jsx
<div className="avatar">
  <div className="w-24 rounded">
    <img src="https://img.daisyui.com/images/profile/demo/batperson@192.webp" />
  </div>
</div>
```

--------------------------------

### DaisyUI Horizontal Menu (JSX)

Source: https://daisyui.com/components/menu

Provides a JSX example for creating a horizontal menu with DaisyUI. This is useful for React projects where navigation elements need to be displayed in a row, applying the 'menu-horizontal' class.

```jsx
<ul className="menu menu-horizontal bg-base-200">
  <li><a>Item 1</a></li>
  <li><a>Item 2</a></li>
  <li><a>Item 3</a></li>
</ul>
```

--------------------------------

### DaisyUI Tabs Component Examples with JSX (React)

Source: https://daisyui.com/components/tab

Illustrates the implementation of DaisyUI tabs using JSX syntax, commonly found in React projects. It covers various sizes (xs, sm, md, lg, xl) with active and inactive tab states.

```jsx
<div role="tablist" className="tabs tabs-lift tabs-xs">
  <a role="tab" className="tab">Xsmall</a>
  <a role="tab" className="tab tab-active">Xsmall</a>
  <a role="tab" className="tab">Xsmall</a>
</div>

<div role="tablist" className="tabs tabs-lift tabs-sm">
  <a role="tab" className="tab">Small</a>
  <a role="tab" className="tab tab-active">Small</a>
  <a role="tab" className="tab">Small</a>
</div>

<div role="tablist" className="tabs tabs-lift">
  <a role="tab" className="tab">Medium</a>
  <a role="tab" className="tab tab-active">Medium</a>
  <a role="tab" className="tab">Medium</a>
</div>

<div role="tablist" className="tabs tabs-lift tabs-lg">
  <a role="tab" className="tab">Large</a>
  <a role="tab" className="tab tab-active">Large</a>
  <a role="tab" className="tab">Large</a>
</div>

<div role="tablist" className="tabs tabs-lift tabs-xl">
  <a role="tab" className="tab">Xlarge</a>
  <a role="tab" className="tab tab-active">Xlarge</a>
  <a role="tab" className="tab">Xlarge</a>
</div>
```

--------------------------------

### DaisyUI Join: Email Input and Subscribe Button

Source: https://daisyui.com/components/join

Illustrates a simple subscription form where an email input and a subscribe button are joined. This example highlights the use of `rounded-r-full` on the button to create a rounded end for the joined group.

```html
<div class="join">
  <input class="input join-item" placeholder="Email" />
  <button class="btn join-item rounded-r-full">Subscribe</button>
</div>
```

```jsx
<div className="join">
  <input className="input join-item" placeholder="Email" />
  <button className="btn join-item rounded-r-full">Subscribe</button>
</div>
```

--------------------------------

### Select Component with Modifiers

Source: https://daisyui.com/llms

HTML select element for picking values from a list of options. Supports optional modifier classes for styling, color variants, and sizes. The {MODIFIER} placeholder accepts style, color, and size class names.

```html
<select class="select {MODIFIER}">
  <option>Option</option>
</select>
```

--------------------------------

### DaisyUI Tooltip - Accent Color (React JSX)

Source: https://daisyui.com/components/tooltip

This example shows an accent-colored tooltip implemented with DaisyUI in React JSX. It applies 'tooltip-accent' and 'btn-accent' classes for styling. The tooltip content is 'accent'.

```jsx
<div className="tooltip tooltip-open tooltip-accent" data-tip="accent">
  <button className="btn btn-accent">accent</button>
</div>
```

--------------------------------

### DaisyUI Pagination with Active State (HTML)

Source: https://daisyui.com/components/pagination

Demonstrates how to create a pagination component using daisyUI's 'join' and 'join-item' classes. The 'btn-active' class is used to highlight the current page. This component is built using standard HTML and daisyUI classes.

```html
<div class="join">
  <button class="join-item btn">1</button>
  <button class="join-item btn btn-active">2</button>
  <button class="join-item btn">3</button>
  <button class="join-item btn">4</button>
</div>
```

--------------------------------

### Inline Code Styling with daisyUI and Tailwind CSS Typography

Source: https://daisyui.com/docs/layout-and-typography

Provides an example of styling inline code snippets within text using daisyUI and Tailwind CSS Typography, making code elements stand out clearly.

```html
Here is an example of inline code: `console.log('Hello, world!');`
```

--------------------------------

### HTML: Hardcoded Colors Example

Source: https://daisyui.com/docs/colors

This HTML snippet demonstrates the use of hardcoded color names for styling elements. It requires more class names to support dark mode and leads to higher maintenance costs and slower development.

```html
<div class="bg-zinc-100">
  <div class="border-zinc-200 bg-zinc-50 text-zinc-800">
    This is a hardcoded dark text on a light background, it needs double the amount of class names
    to support dark mode.
  </div>
</div>
```

--------------------------------

### Warning Color Link with DaisyUI

Source: https://daisyui.com/components/link

This code snippet shows how to apply the warning color theme to a DaisyUI link using the 'link link-warning' classes. Examples are provided for HTML and React JSX.

```html
<a class="link link-warning">Click me</a>
```

```jsx
<a className="link link-warning">Click me</a>
```

--------------------------------

### DaisyUI Drawer Component Syntax

Source: https://daisyui.com/llms

The DaisyUI drawer component creates a sidebar that can be shown or hidden on the left or right side of the page. It uses classes like `drawer`, `drawer-content`, `drawer-side`, and `drawer-toggle`. Variants like `is-drawer-open:` and `is-drawer-close:` can control its state.

```html
<div class="drawer {MODIFIER}">
  <div class="drawer-content">
    <!-- Page content here -->
  </div>
  <div class="drawer-side">
    <label for="my-drawer" class="drawer-overlay"></label>
    <ul class="menu p-4 w-80 bg-base-100 text-base-content">
      <!-- Sidebar content -->
    </ul>
  </div>
</div>
```

--------------------------------

### Link Styling with daisyUI

Source: https://daisyui.com/docs/layout-and-typography

Shows how to create and style links using daisyUI, ensuring consistent appearance across the website and integration with daisyUI's theming system.

```html
<a href="#">Visit daisyUI</a>
```

--------------------------------

### daisyUI Responsive Card Layout Component

Source: https://daisyui.com/pages/best-component-library-for-2026

Demonstrates a responsive card component with semantic class names and predictable behavior. The card includes an image, title, description, and action buttons, showcasing zero-configuration responsive design principles.

```html
<!-- Responsive card layout -->
<div class="card w-96 bg-base-100 shadow-xl">
  <figure><img src="photo.jpg" alt="Photo" /></figure>
  <div class="card-body">
    <h2 class="card-title">Card Title</h2>
    <p>Card description goes here.</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Action</button>
    </div>
  </div>
</div>
```

--------------------------------

### Use Responsive Modifiers with daisyUI Components

Source: https://daisyui.com/docs/v5

daisyUI 5 makes all modifier classes responsive by default. This allows for the use of responsive prefixes like 'md:' with any component modifier, enabling adaptive designs.

```html
<button class="btn md:btn-lg lg:btn-xl">Responsive Button</button>
```

--------------------------------

### Add daisyUI GitMCP Server (HTTP Transport)

Source: https://daisyui.com/docs/editor/claudecode

This command adds the daisyUI GitMCP server to Claude Code using HTTP transport. It specifies the server name and its URL, allowing for daisyUI code generation.

```bash
claude mcp add --transport http daisyui https://gitmcp.io/saadeghi/daisyui
```

--------------------------------

### DaisyUI Diff Component Syntax

Source: https://daisyui.com/llms

The DaisyUI diff component displays a side-by-side comparison of two items. It uses `diff-item-1` and `diff-item-2` for the content and `diff-resizer` for the separator. Aspect ratio classes like `aspect-16/9` can be added to the main `figure` element.

```html
<figure class="diff">
  <div class="diff-item-1">{item1}</div>
  <div class="diff-item-2">{item2}</div>
  <div class="diff-resizer"></div>
</figure>
```

--------------------------------

### Create Textarea Input with Optional Styling

Source: https://daisyui.com/llms

Build multi-line text input fields with optional style, color, and size modifiers. Supports ghost style variant and multiple color themes (neutral, primary, secondary, accent, info, success, warning, error) with size options from extra-small to extra-large.

```html
<textarea class="textarea {MODIFIER}" placeholder="Bio"></textarea>
```

--------------------------------

### Swap Component for Toggle Visibility

Source: https://daisyui.com/llms

Component that toggles visibility between two elements using a checkbox input or CSS class. Supports swap-rotate and swap-flip style modifiers and swap-indeterminate state for indeterminate checkboxes.

```html
<label class="swap {MODIFIER}">
  <input type="checkbox" />
  <div class="swap-on">{content when active}</div>
  <div class="swap-off">{content when inactive}</div>
</label>
```

```html
<div class="swap {MODIFIER}">
  <div class="swap-on">{content when active}</div>
  <div class="swap-off">{content when inactive}</div>
</div>
```

--------------------------------

### JSX Input with Label, Placeholder, and Optional Badge

Source: https://daisyui.com/components/input

This JSX example shows how to create an input field with a text label, a placeholder, and an 'Optional' badge using DaisyUI classes. It's functionally identical to the HTML version but uses JSX syntax.

```jsx
<label className="input">
  Path
  <input type="text" className="grow" placeholder="src/app/" />
  <span className="badge badge-neutral badge-xs">Optional</span>
</label>
```

--------------------------------

### HTML Hover Gallery Example

Source: https://daisyui.com/components/hover-gallery

This HTML snippet demonstrates the basic implementation of the daisyUI Hover Gallery component. It uses a `<figure>` element with the 'hover-gallery' class to contain multiple `<img>` tags. Hovering horizontally over the gallery reveals the subsequent images. This component is limited to a maximum of 10 images.

```html
<figure class="hover-gallery max-w-60">
  <img src="https://img.daisyui.com/images/stock/daisyui-hat-1.webp" />
  <img src="https://img.daisyui.com/images/stock/daisyui-hat-2.webp" />
  <img src="https://img.daisyui.com/images/stock/daisyui-hat-3.webp" />
  <img src="https://img.daisyui.com/images/stock/daisyui-hat-4.webp" />
</figure>
```

--------------------------------

### Rating Component Syntax

Source: https://daisyui.com/llms

Shows the basic structure for a DaisyUI rating component, which uses radio buttons styled as stars. The 'rating' class is applied to a div, and individual radio inputs use the 'mask mask-star' class.

```html
<div class="rating {MODIFIER}">
  <input type="radio" name="rating-1" class="mask mask-star" />
</div>
```

--------------------------------

### Tailwind CSS Button Example

Source: https://daisyui.com/pages/minimal-css-framework

This code snippet demonstrates how to create a button using only Tailwind CSS classes. It includes styling for different states like hover and focus, as well as dark mode support, resulting in a lengthy list of class names.

```html
<button
  class="bg-zinc-100 border font-semibold text-zinc-900 
  text-sm px-4 duration-200 py-2.5 transition-all hover:border-zinc-300 
  hover:bg-zinc-200 focus-visible:outline-2 focus-visible:outline-offset-2 
  focus-visible:outline-zinc-900 active:translate-y-[0.5px] inline-flex gap-2 
  rounded-sm active:border-zinc-300 active:bg-zinc-200 active:shadow-none 
  text-center align-middle cursor-pointer border-zinc-200 dark:border-zinc-700 
  dark:bg-neutral-700 dark:text-zinc-300 dark:hover:border-zinc-950 
  dark:hover:bg-zinc-950 dark:focus-visible:outline-zinc-200 
  dark:active:border-zinc-950 dark:active:bg-zinc-900"
>
  Click Me
</button>
```

--------------------------------

### Basic DaisyUI Select Component (React)

Source: https://daisyui.com/components/select

Provides an example of the DaisyUI select component implemented in React. It mirrors the HTML functionality, enabling users to choose from a list of options, styled with DaisyUI classes. Note the use of `defaultValue` for initial selection.

```jsx
<select defaultValue="Pick a color" className="select">
  <option disabled={true}>Pick a color</option>
  <option>Crimson</option>
  <option>Amber</option>
  <option>Velvet</option>
</select>
```

--------------------------------

### DaisyUI Collapse with Focus

Source: https://daisyui.com/components/collapse

Demonstrates a DaisyUI collapse component that functions with focus. When the element loses focus, the content is hidden. It requires the 'collapse', 'collapse-title', and 'collapse-content' classes. This example uses standard HTML.

```html
<div tabindex="0" class="collapse bg-base-100 border-base-300 border">
  <div class="collapse-title font-semibold">How do I create an account?</div>
  <div class="collapse-content text-sm">
    Click the "Sign Up" button in the top right corner and follow the registration process.
  </div>
</div>
```

--------------------------------

### Add daisyUI Plugin Directive to main.css

Source: https://daisyui.com/docs/install/wordpress

Add the daisyUI plugin directive to your main.css file in the WindPress editor to enable daisyUI component classes in your WordPress theme. This single line imports all daisyUI components and utilities after Tailwind CSS is configured.

```css
@plugin "daisyui";
```

--------------------------------

### HTML Input with File Icon and Placeholder

Source: https://daisyui.com/components/input

This snippet demonstrates an input field styled with a file icon, suitable for file paths or similar inputs. It uses a placeholder to guide the user and includes an SVG icon representing a file.

```html
<label class="input">
  <svg class="h-[1em] opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
    <g
      stroke-linejoin="round"
      stroke-linecap="round"
      stroke-width="2.5"
      fill="none"
      stroke="currentColor"
    >
      <path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z"></path>
      <path d="M14 2v4a2 2 0 0 0 2 2h4"></path>
    </g>
  </svg>
  <input type="text" class="grow" placeholder="index.php" />
</label>
```

--------------------------------

### File Input with Fieldset and Label (HTML)

Source: https://daisyui.com/components/file-input

Provides an example of integrating the DaisyUI file input within a fieldset, including a legend and a label for additional context. This structure is useful for grouping related form elements and providing user guidance on file size limits.

```html
<fieldset class="fieldset">
  <legend class="fieldset-legend">Pick a file</legend>
  <input type="file" class="file-input" />
  <label class="label">Max size 2MB</label>
</fieldset>
```

--------------------------------

### Theme Controller Checkbox Input (HTML)

Source: https://daisyui.com/components/theme-controller

Example of a theme controller using an HTML checkbox input. This component changes the page theme based on its checked state and the 'value' attribute. It works with CSS only.

```html
<input type="checkbox" value="synthwave" class="checkbox theme-controller" />
```

```html
<input type="checkbox" value="synthwave" class="checkbox theme-controller" />
```

--------------------------------

### Create Tabs Component with Buttons or Radio Inputs

Source: https://daisyui.com/llms

Build tabbed interfaces using either button or radio input elements. Buttons provide basic tab structure, while radio inputs enable tab content switching functionality. Optional modifiers control styling with classes like tabs-box, tabs-border, and tabs-lift.

```html
<div role="tablist" class="tabs {MODIFIER}">
  <button role="tab" class="tab">Tab</button>
</div>
```

```html
<div role="tablist" class="tabs tabs-box">
  <input type="radio" name="my_tabs" class="tab" aria-label="Tab" />
</div>
```

--------------------------------

### HTML Button Comparison: Without and With daisyUI

Source: https://daisyui.com/pages/best-component-library-for-beginners

Demonstrates the significant reduction in HTML code needed for a button when using daisyUI compared to writing raw Tailwind CSS classes. This highlights daisyUI's simplicity and efficiency for creating UI elements.

```html
<button
  class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
>
  Click Me
</button>
```

```html
<button class="btn">Click Me</button>
```

--------------------------------

### Clean Next.js Global CSS

Source: https://daisyui.com/blog/install-daisyui-and-tailwindcss-in-nextjs

Minimalist global CSS file for Next.js, including only the necessary Tailwind CSS directives. This removes default Next.js styles for a clean slate.

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

```

--------------------------------

### DaisyUI Avatar Placeholder with Text (HTML)

Source: https://daisyui.com/components/avatar

Shows how to implement avatar placeholders using text, suitable for when an image is not available. Includes examples of different sizes and online status. Uses DaisyUI CSS classes and HTML structure.

```html
<div class="avatar avatar-placeholder">
  <div class="bg-neutral text-neutral-content w-24 rounded-full">
    <span class="text-3xl">D</span>
  </div>
</div>
<div class="avatar avatar-online avatar-placeholder">
  <div class="bg-neutral text-neutral-content w-16 rounded-full">
    <span class="text-xl">AI</span>
  </div>
</div>
<div class="avatar avatar-placeholder">
  <div class="bg-neutral text-neutral-content w-12 rounded-full">
    <span>SY</span>
  </div>
</div>
<div class="avatar avatar-placeholder">
  <div class="bg-neutral text-neutral-content w-8 rounded-full">
    <span class="text-xs">UI</span>
  </div>
</div>
```

--------------------------------

### Applying a Specific daisyUI Theme (Material)

Source: https://daisyui.com/blog/nexus-dashboard-template

Shows how to include and apply a specific daisyUI theme, such as 'material', by copying its configuration and setting the `data-theme` attribute on the HTML tag. Ensure Tailwind CSS and daisyUI are installed.

```css
@plugin "daisyui/theme" {
  name: "material";
  color-scheme: light;
  --color-primary: #167bff;
  /* ... */
}

/* Then apply it: <html data-theme="material"> */
```

--------------------------------

### Configure PostCSS for Tailwind CSS

Source: https://daisyui.com/docs/install/angular

Creates a `.postcssrc.json` file at the root of your project to configure the PostCSS build process, specifically enabling the Tailwind CSS plugin. This file tells PostCSS to use the Tailwind CSS transformations.

```json
{
  "plugins": {
    "@tailwindcss/postcss": {}
  }
}
```

--------------------------------

### Checkbox Sizes React

Source: https://daisyui.com/components/checkbox

Presents the React version for applying various checkbox sizes using daisyUI classes. This code snippet includes examples for extra small to extra large checkboxes.

```jsx
<input type="checkbox" defaultChecked className="checkbox checkbox-xs" />
<input type="checkbox" defaultChecked className="checkbox checkbox-sm" />
<input type="checkbox" defaultChecked className="checkbox checkbox-md" />
<input type="checkbox" defaultChecked className="checkbox checkbox-lg" />
<input type="checkbox" defaultChecked className="checkbox checkbox-xl" />
```

--------------------------------

### DaisyUI Dock Small Size HTML Example

Source: https://daisyui.com/components/dock

This HTML snippet illustrates how to implement a small-sized dock component using DaisyUI classes. It includes three button elements, each containing an SVG icon, with one button designated as 'dock-active'.

```html
<div class="dock dock-sm">
  <button>
    <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" stroke-linejoin="miter" stroke-linecap="butt"><polyline points="1 11 12 2 23 11" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="2"></polyline><path d="m5,13v7c0,1.105.895,2,2,2h10c1.105,0,2-.895,2-2v-7" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></path><line x1="12" y1="22" x2="12" y2="18" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></line></g></svg>
  </button>
  
  <button class="dock-active">
    <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" stroke-linejoin="miter" stroke-linecap="butt"><polyline points="3 14 9 14 9 17 15 17 15 14 21 14" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="2"></polyline><rect x="3" y="3" width="18" height="18" rx="2" ry="2" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></rect></g></svg>
  </button>
  
  <button>
    <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" stroke-linejoin="miter" stroke-linecap="butt"><circle cx="12" cy="12" r="3" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></circle><path d="m22,13.25v-2.5l-2.318-.966c-.167-.581-.395-1.135-.682-1.654l.954-2.318-1.768-1.768-2.318.954c-.518-.287-1.073-.515-1.654-.682l-.966-2.318h-2.5l-.966,2.318c-.581.167-1.135.395-1.654.682l-2.318-.954-1.768,1.768.954,2.318c-.287.518-.515,1.073-.682,1.654l-2.318.966v2.5l2.318.966c.167.581.395,1.135.682,1.654l-.954,2.318,1.768,1.768,2.318-.954c.518.287,1.073.515,1.654.682l.966,2.318h2.5l.966-2.318c.581-.167,1.135-.395,1.654-.682l2.318.954,1.768-1.768-.954-2.318c.287-.518.515-1.073.682-1.654l2.318-.966Z" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></path></g></svg>
  </button>
</div>
```

--------------------------------

### Configure Tailwind CSS with daisyUI Plugin

Source: https://daisyui.com/blog/install-daisyui-and-tailwindcss-in-nextjs

TypeScript configuration for Tailwind CSS, adding daisyUI as a plugin. This step enables daisyUI's styles and components within the Next.js project.

```typescript
import type { Config } from 'tailwindcss'
+ import daisyui from 'daisyui'
const config: Config = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
        'gradient-conic':
          'conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))',
      },
    },
  },
- plugins: [],
+ plugins: [daisyui],
}
export default config

```

--------------------------------

### Responsive Mega Menu with Submenus (HTML)

Source: https://daisyui.com/components/menu

A responsive mega menu implementation using DaisyUI's menu component in plain HTML. It supports horizontal display on larger screens and includes nested submenus for organized navigation. This example is framework-agnostic and uses standard HTML structure.

```html
<ul class="menu xl:menu-horizontal bg-base-200 rounded-box lg:min-w-max">
  <li>
    <a>Solutions</a>
    <ul>
      <li><a>Design</a></li>
      <li><a>Development</a></li>
      <li><a>Hosting</a></li>
      <li><a>Domain register</a></li>
    </ul>
  </li>
  <li>
    <a>Enterprise</a>
    <ul>
      <li><a>CRM software</a></li>
      <li><a>Marketing management</a></li>
      <li><a>Security</a></li>
      <li><a>Consulting</a></li>
    </ul>
  </li>
  <li>
    <a>Products</a>
    <ul>
      <li><a>UI Kit</a></li>
      <li><a>WordPress themes</a></li>
      <li><a>WordPress plugins</a></li>
      <li>
        <a>Open source</a>
        <ul>
          <li><a>Auth management system</a></li>
          <li><a>VScode theme</a></li>
          <li><a>Color picker app</a></li>
        </ul>
      </li>
    </ul>
  </li>
  <li>
    <a>Company</a>
    <ul>
      <li><a>About us</a></li>
      <li><a>Contact us</a></li>
      <li><a>Privacy policy</a></li>
      <li><a>Press kit</a></li>
    </ul>
  </li>
</ul>
```

--------------------------------

### Framework-Agnostic Styling with DaisyUI Classes

Source: https://daisyui.com/pages/scalable-component-library

Shows how the same CSS classes, like `btn btn-primary`, can be used across different JavaScript frameworks including Next.js, React, Vue.js, and Svelte. This demonstrates framework agnosticism, ensuring visual consistency regardless of the underlying technology.

```html
<!-- Next.js landing page -->
<button className="btn btn-primary">Get Started</button>

<!-- React admin dashboard -->
<button className="btn btn-primary">Save Changes</button>

<!-- Vue.js analytics -->
<button class="btn btn-primary">Export Data</button>

<!-- Svelte documentation -->
<button class="btn btn-primary">View Docs</button>
```

--------------------------------

### DaisyUI Avatar Placeholder with Text (JSX)

Source: https://daisyui.com/components/avatar

Provides examples of text-based avatar placeholders using JSX, ideal for React projects. Demonstrates varying sizes and online status indicators, relying on DaisyUI CSS classes.

```jsx
<div className="avatar avatar-placeholder">
  <div className="bg-neutral text-neutral-content w-24 rounded-full">
    <span className="text-3xl">D</span>
  </div>
</div>
<div className="avatar avatar-online avatar-placeholder">
  <div className="bg-neutral text-neutral-content w-16 rounded-full">
    <span className="text-xl">AI</span>
  </div>
</div>
<div className="avatar avatar-placeholder">
  <div className="bg-neutral text-neutral-content w-12 rounded-full">
    <span>SY</span>
  </div>
</div>
<div className="avatar avatar-placeholder">
  <div className="bg-neutral text-neutral-content w-8 rounded-full">
    <span className="text-xs">UI</span>
  </div>
</div>
```

--------------------------------

### Range Slider Component Syntax

Source: https://daisyui.com/llms

Illustrates the HTML syntax for a DaisyUI range slider. The 'range' class is used on an input element of type 'range', with optional color and size modifiers. 'min' and 'max' attributes are required.

```html
<input type="range" min="0" max="100" value="40" class="range {MODIFIER}" />
```

--------------------------------

### Chat Bubble Component for Conversations

Source: https://daisyui.com/llms

Chat bubbles display individual lines of conversation, including author information and timestamps. Key classes include 'chat', 'chat-image', 'chat-header', 'chat-footer', and 'chat-bubble'. Bubbles can be placed at the 'chat-start' or 'chat-end' of the conversation and colored using variants like 'chat-bubble-primary'.

```html
<div class="chat chat-start">
  <div class="chat-image avatar">
    <div class="w-10 rounded-full">
      <img src="/images/stock/photo-1534528736661-d95f166972f0.jpg" />
    </div>
  </div>
  <div class="chat-header">
    Awesome
    <time class="text-xs opacity-50">12:46</time>
  </div>
  <div class="chat-bubble chat-bubble-primary">Hello there!</div>
</div>
<div class="chat chat-end">
  <div class="chat-image avatar">
    <div class="w-10 rounded-full">
      <img src="/images/stock/photo-1534528736661-d95f166972f0.jpg" />
    </div>
  </div>
  <div class="chat-header">
    You
    <time class="text-xs opacity-50">12:48</time>
  </div>
  <div class="chat-bubble chat-bubble-secondary">Hi!</div>
</div>
```

--------------------------------

### Advanced CSS for UI without JavaScript

Source: https://daisyui.com/pages/scalable-component-library

Demonstrates how advanced CSS features like grid layouts, interactive states, animations, dark mode, and container queries can achieve complex UI patterns without JavaScript. These examples showcase the power of modern CSS in building dynamic and responsive web interfaces.

```css
/* Complex layouts without JavaScript */
.responsive-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1rem;
}

/* Interactive states without JavaScript */
.dropdown:focus-within .dropdown-content {
  opacity: 1;
  visibility: visible;
  transform: translateY(0);
}

/* Smooth animations without JavaScript */
@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateX(-100%);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

/* Dark mode without JavaScript */
@media (prefers-color-scheme: dark) {
  :root {
    --bg-color: #1a1a1a;
    --text-color: #ffffff;
  }
}

/* Container queries for responsive components */
@container (min-width: 400px) {
  .card {
    display: flex;
    flex-direction: row;
  }
}
```

--------------------------------

### Theme Controller Checkbox Input (React)

Source: https://daisyui.com/components/theme-controller

Example of a theme controller using a React checkbox input. This component changes the page theme based on its checked state and the 'value' attribute. It works with CSS only.

```jsx
<input type="checkbox" value="synthwave" className="checkbox theme-controller" />
```

```jsx
<input type="checkbox" value="synthwave" className="checkbox theme-controller" />
```

--------------------------------

### Status Icon Component

Source: https://daisyui.com/llms

Minimal icon component for displaying status indicators like online, offline, or error states. Supports color variants and size modifiers. Note: This component does not render any visible content by itself.

```html
<span class="status {MODIFIER}"></span>
```

--------------------------------

### Window Mockup with Background Color - HTML

Source: https://daisyui.com/components/mockup-window

This HTML snippet illustrates creating a window mockup with a background color using daisyUI classes. It's a simple component that adds visual distinction to the window element.

```html
<div class="mockup-window bg-base-100 border border-base-300">
  <div class="grid place-content-center h-80">Hello!</div>
</div>
```

--------------------------------

### DaisyUI File Input Primary Colors (HTML)

Source: https://daisyui.com/components/file-input

This snippet shows how to apply different primary color themes to the file input component using DaisyUI's utility classes in HTML. It includes examples for 'primary', 'secondary', 'accent', 'neutral', 'info', 'success', 'warning', and 'error' color variants. No external dependencies are required beyond DaisyUI.

```html
<input type="file" class="file-input file-input-primary" />
<input type="file" class="file-input file-input-secondary" />
<input type="file" class="file-input file-input-accent" />
<input type="file" class="file-input file-input-neutral" />
<input type="file" class="file-input file-input-info" />
<input type="file" class="file-input file-input-success" />
<input type="file" class="file-input file-input-warning" />
<input type="file" class="file-input file-input-error" />
```

--------------------------------

### DaisyUI File Input Component

Source: https://daisyui.com/llms

The file-input component allows users to upload files. It supports various modifiers for styling, including ghost style, colors, and sizes. The basic syntax involves an HTML input tag with type 'file' and the 'file-input' class, optionally combined with style, color, and size classes.

```html
<input type="file" class="file-input file-input-bordered" />
```

--------------------------------

### Hover Underline Effect for Links

Source: https://daisyui.com/components/link

This code demonstrates how to make a DaisyUI link show its underline only on hover by applying the 'link link-hover' classes. Examples are provided for HTML and React JSX.

```html
<a class="link link-hover">Click me</a>
```

```jsx
<a className="link link-hover">Click me</a>
```

--------------------------------

### DaisyUI Toggle with Fieldset and Label (HTML)

Source: https://daisyui.com/components/toggle

This example shows how to integrate a DaisyUI Toggle component within a fieldset and label structure for better form organization. It includes a legend for the fieldset and a label containing the toggle and associated text.

```html
<fieldset class="fieldset bg-base-100 border-base-300 rounded-box w-64 border p-4">
  <legend class="fieldset-legend">Login options</legend>
  <label class="label">
    <input type="checkbox" checked="checked" class="toggle" />
    Remember me
  </label>
</fieldset>
```

--------------------------------

### Add Context7 MCP Server (HTTP Transport)

Source: https://daisyui.com/docs/editor/claudecode

This command configures Claude Code to use the Context7 MCP server via HTTP transport. It specifies the transport protocol and the URL of the Context7 MCP server.

```bash
claude mcp add --transport http context7 https://mcp.context7.com/mcp
```

--------------------------------

### Basic DaisyUI Progress Bar (HTML)

Source: https://daisyui.com/components/progress

Demonstrates the basic usage of the DaisyUI progress component in HTML. It shows how to create a progress bar with a specified width and current value. The component relies on the 'progress' class for styling.

```html
<progress class="progress w-56" value="0" max="100"></progress>
<progress class="progress w-56" value="10" max="100"></progress>
<progress class="progress w-56" value="40" max="100"></progress>
<progress class="progress w-56" value="70" max="100"></progress>
<progress class="progress w-56" value="100" max="100"></progress>
```

--------------------------------

### DaisyUI Simple Footer with Social Links Example

Source: https://daisyui.com/components/footer

This HTML snippet showcases a simpler footer design with DaisyUI. It includes a copyright notice and placeholders for social media links using SVG icons. This footer is designed to be placed at the bottom of a page and is styled with a top border.

```html
<footer class="footer bg-base-200 text-base-content border-base-300 border-t px-10 py-4">
  <aside class="grid-flow-col items-center">
    <svg
      width="24"
      height="24"
      viewBox="0 0 24 24"
      xmlns="http://www.w3.org/2000/svg"
      fill-rule="evenodd"
      clip-rule="evenodd"
      class="fill-current">
      <path
        d="M22.672 15.226l-2.432.811.841 2.515c.33 1.019-.209 2.127-1.23 2.456-1.15.325-2.148-.321-2.463-1.226l-.84-2.518-5.013 1.677.84 2.517c.391 1.203-.434 2.542-1.831 2.542-.88 0-1.601-.564-1.86-1.314l-.842-2.516-2.431.809c-1.135.328-2.145-.317-2.463-1.229-.329-1.018.211-2.127 1.231-2.456l2.432-.809-1.621-4.823-2.432.808c-1.355.384-2.558-.59-2.558-1.839 0-.817.509-1.582 1.327-1.846l2.433-.809-.842-2.515c-.33-1.02.211-2.129 1.232-2.458 1.02-.329 2.13.209 2.461 1.229l.842 2.515 5.011-1.677-.839-2.517c-.403-1.238.484-2.553 1.843-2.553.819 0 1.585.509 1.85 1.326l.841 2.517 2.431-.81c1.02-.33 2.131.211 2.461 1.229.332 1.018-.21 2.126-1.23 2.456l-2.433.809 1.622 4.823 2.433-.809c1.242-.401 2.557.484 2.557 1.838 0 .819-.51 1.583-1.328 1.847m-8.992-6.428l-5.01 1.675 1.619 4.828 5.011-1.674-1.62-4.829z"></path>
    </svg>
    <p>
      ACME Industries Ltd.
      <br />
      Providing reliable tech since 1992
    </p>
  </aside>
  <nav class="md:place-self-center md:justify-self-end">
    <div class="grid grid-flow-col gap-4">
      <a>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          class="fill-current">
          <path
            d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"></path>
        </svg>
      </a>
      <a>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          class="fill-current">
          <path
            d="M19.615 3.184c-3.604-.246-11.631-.245-15.23 0-3.897.266-4.356 2.62-4.385 8.816.029 6.185.484 8.549 4.385 8.816 3.6.245 11.626.246 15.23 0 3.897-.266 4.356-2.62 4.385-8.816-.029-6.185-.484-8.549-4.385-8.816zm-10.615 12.816v-8l8 3.993-8 4.007z"></path>
        </svg>
      </a>
      <a>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          class="fill-current">
          <path
            d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z"></path>
        </svg>
      </a>
    </div>
  </nav>
</footer>
```

--------------------------------

### DaisyUI List with Song Information and Actions

Source: https://daisyui.com/components/list

This snippet demonstrates a list item representing a song, including album art, artist and song title, a description, and play/like buttons. It utilizes DaisyUI classes for styling.

```html
<ul class="list bg-base-100 rounded-box shadow-md">
  
  <li class="p-4 pb-2 text-xs opacity-60 tracking-wide">Most played songs this week</li>
  
  <li class="list-row">
    <div><img class="size-10 rounded-box" src="https://img.daisyui.com/images/profile/demo/1@94.webp"/></div>
    <div>
      <div>Dio Lupa</div>
      <div class="text-xs uppercase font-semibold opacity-60">Remaining Reason</div>
    </div>
    <p class="list-col-wrap text-xs">
      "Remaining Reason" became an instant hit, praised for its haunting sound and emotional depth. A viral performance brought it widespread recognition, making it one of Dio Lupa’s most iconic tracks.
    </p>
    <button class="btn btn-square btn-ghost">
      <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g strokeLinejoin="round" strokeLinecap="round" strokeWidth="2" fill="none" stroke="currentColor"><path d="M6 3L20 12 6 21 6 3z"></path></g></svg>
    </button>
    <button class="btn btn-square btn-ghost">
      <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g strokeLinejoin="round" strokeLinecap="round" strokeWidth="2" fill="none" stroke="currentColor"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path></g></svg>
    </button>
  </li>
  

```

--------------------------------

### Figma API Integration for daisyUI Blueprint MCP

Source: https://daisyui.com/blueprint

This configuration snippet demonstrates how to integrate Figma API credentials into the daisyUI Blueprint MCP server setup. It includes the FIGMA environment variable, which is essential for enabling Figma-to-code conversion.

```json
"daisyui-blueprint": {
    "type": "stdio",
    "command": "npx",
    "env": {
      "LICENSE": "YOUR LICENSE KEY",
      "EMAIL": "YOUR EMAIL",
      "FIGMA": "YOUR FIGMA API KEY"
    }
  }
```

--------------------------------

### Button with Loading Spinner (JSX)

Source: https://daisyui.com/components/button

Shows how to integrate a loading spinner into buttons within a React application using DaisyUI's classes via JSX. This includes examples for square buttons and buttons with accompanying text, using `className` for styling.

```jsx
<button className="btn btn-square">
  <span className="loading loading-spinner"></span>
</button>

<button className="btn">
  <span className="loading loading-spinner"></span>
  loading
</button>
```

--------------------------------

### DaisyUI Divider Component Syntax

Source: https://daisyui.com/llms

The DaisyUI divider component separates content vertically or horizontally. It can include text and be modified with classes for direction, color, and placement. Omitting text creates a blank divider.

```html
<div class="divider {MODIFIER}">{text}</div>
```

--------------------------------

### Code Block Styling with daisyUI

Source: https://daisyui.com/docs/layout-and-typography

Illustrates how to display code blocks using daisyUI, which supports styling for larger code snippets potentially integrated with highlighting libraries like Shiki or Prism.

```javascript
function greet() {
  console.log('Hello, world!');
}
```

--------------------------------

### Styled DaisyUI Timeline with Primary Color

Source: https://daisyui.com/components/timeline

This example demonstrates a DaisyUI timeline styled with the primary color. It applies the 'bg-primary' class to the horizontal rules and uses 'text-primary' for the SVG icons, creating a cohesive look.

```html
<ul className="timeline">
  <li>
    <div className="timeline-start timeline-box">First Macintosh computer</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="text-primary h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <hr className="bg-primary" />
  </li>
  <li>
    <hr className="bg-primary" />
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="text-primary h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iMac</div>
    <hr className="bg-primary" />
  </li>
  <li>
    <hr className="bg-primary" />
    <div className="timeline-start timeline-box">iPod</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="text-primary h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iPhone</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-start timeline-box">Apple Watch</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
  </li>
</ul>
```

--------------------------------

### HTML Responsive Grid Layout with Tailwind CSS

Source: https://daisyui.com/pages/ui-library-for-hackaton

Demonstrates the complexity of building responsive layouts that work across multiple screen sizes (mobile, tablet, laptop). Uses Tailwind CSS utility classes to manage responsive breakpoints (sm, lg, xl) for grid columns, gaps, padding, and component sizing, illustrating the overhead required for cross-device compatibility.

```html
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4 sm:gap-6 lg:gap-8 p-4 sm:p-6 lg:p-8">
  <div class="bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow duration-200 p-4 sm:p-6">
    <h3 class="text-lg sm:text-xl font-semibold mb-2 sm:mb-3 text-gray-900">Card Title</h3>
    <p class="text-sm sm:text-base text-gray-600 mb-4">Card description goes here...</p>
    <button class="w-full sm:w-auto bg-blue-600 hover:bg-blue-700 text-white font-medium py-2 px-4 rounded transition-colors duration-200">
      Action
    </button>
  </div>
</div>
```

--------------------------------

### DaisyUI HTML Structure and Components

Source: https://daisyui.com/codepen

This HTML snippet showcases the integration of DaisyUI with Tailwind CSS. It includes examples of buttons, tabs, and form elements styled using DaisyUI classes. The code demonstrates how to link DaisyUI themes and the Tailwind CSS browser package.

```html
<!-- daisyUI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />

<!-- All daisyUI themes -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@5/themes.css" rel="stylesheet" type="text/css" />

<!-- Tailwind CSS -->
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

<!-- buttons -->
<div class="p-4">
 <button class="btn btn-primary">primary</button>
 <button class="btn btn-secondary">secondary</button>
 <button class="btn btn-accent">accent</button>
</div>

<!-- same buttons with another theme! -->
<div class="p-4" data-theme="abyss">
 <button class="btn btn-primary">Primary</button>
 <button class="btn btn-secondary">Secondary</button>
 <button class="btn btn-accent">Accent</button>
</div>

<!-- tab -->
<div class="tabs tabs-lift m-4">
 <button class="tab">Tab 1</button>
 <button class="tab tab-active">Tab 2</button>
 <button class="tab">Tab 3</button>
 <button class="tab"></button>
</div>

<!-- toggle, checkbox, radio -->
<div class="p-4">
 <input type="checkbox" class="toggle" />
 <input type="checkbox" class="checkbox" />
 <input type="radio" name="radio-1" class="radio" checked />
</div>
```

--------------------------------

### Example Form Component using Tailwind CSS and daisyUI

Source: https://daisyui.com/index

This HTML snippet showcases a form component with an input field, checkboxes, and a submit button, all styled using a combination of Tailwind CSS utility classes and daisyUI's component class names. It demonstrates how to create a visually appealing and functional form with minimal code.

```html
<div class="w-80 rounded-lg bg-zinc-50 text-zinc-800">
  <div class="flex flex-col gap-3 p-8">
    <input placeholder="Email" class="w-full rounded-sm border border-zinc-300 bg-white px-3 py-2 text-sm focus:ring-2 focus:ring-zinc-700 focus:ring-offset-2 focus:ring-offset-zinc-100 focus:outline-none focus-visible:border-zinc-900"/>
    <label class="flex cursor-pointer items-center text-sm gap-1.5 text-zinc-500">
      <div class="relative inline-block h-5">
        <input type="checkbox" class="peer h-5 w-8 cursor-pointer appearance-none rounded-full border border-zinc-400 peer-checked:bg-white checked:border-zinc-900 focus-visible:ring-2 focus-visible:ring-zinc-400 checked:focus-visible:ring-zinc-900 focus-visible:ring-offset-2 focus-visible:outline-none"/>
        <span class="pointer-events-none absolute start-0.75 top-0.75 block size-[0.875rem] rounded-full bg-zinc-400 transition-all duration-200 peer-checked:start-[0.9375rem] peer-checked:bg-zinc-900"></span>
      </div>
      Submit to newsletter
    </label>
    <label class="flex cursor-pointer items-center text-sm gap-1.5 text-zinc-500">
      <div class="relative inline-block h-5">
        <input type="checkbox" class="peer h-5 w-8 cursor-pointer appearance-none rounded-full border border-zinc-400 peer-checked:bg-white checked:border-zinc-900 focus-visible:ring-2 focus-visible:ring-zinc-400 checked:focus-visible:ring-zinc-900 focus-visible:ring-offset-2 focus-visible:outline-none"/>
        <span class="pointer-events-none absolute start-0.75 top-0.75 block size-[0.875rem] rounded-full bg-zinc-400 transition-all duration-200 peer-checked:start-[0.9375rem] peer-checked:bg-zinc-900"></span>
      </div>
      Accept terms of use
    </label>
    <button class="inline-block cursor-pointer rounded-sm bg-zinc-900 px-4 py-2.5 text-center text-sm font-semibold text-white shadow-[0_.2rem_0.3rem_-.25rem_black] active:shadow-none transition duration-200 ease-in-out focus-visible:ring-2 focus-visible:ring-zinc-700 focus-visible:ring-offset-2 focus-visible:outline-none active:translate-y-[1px]" >Save</button>
  </div>
</div>
```

--------------------------------

### HTML: Semantic Colors Example

Source: https://daisyui.com/docs/colors

This HTML snippet showcases daisyUI's semantic color utility classes. It automatically handles dark mode and reduces the need for additional class names, leading to faster development and easier theme management.

```html
<div class="bg-base-200">
  <div class="bg-base-100 border-base-300 text-base-content">
    This is dark text on a light background, which switches to light text on a dark background in
    dark mode.
  </div>
</div>
```

--------------------------------

### Dropdown Right Aligned (HTML)

Source: https://daisyui.com/components/dropdown

This example demonstrates a basic right-aligned dropdown menu using DaisyUI's 'dropdown-right' class. It's a simple implementation suitable for general use cases where the dropdown should appear to the right of the trigger. Only HTML and DaisyUI are needed.

```html
<div class="dropdown dropdown-right">
  <div tabindex="0" role="button" class="btn m-1">Click ➡️</div>
  <ul tabindex="-1" class="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

--------------------------------

### Apply Global Styles to Lit Element's Shadow DOM

Source: https://daisyui.com/docs/install/lit

Injects global styles, including those from Tailwind CSS and daisyUI, into a Lit element's shadow DOM using `unsafeCSS`. This allows daisyUI class names to be applied to elements within the shadow DOM.

```javascript
import { LitElement, html } from "lit";
import { unsafeCSS } from "lit";
import globalStyles from "./index.css?inline";

export class MyElement extends LitElement {
  static styles = [unsafeCSS(globalStyles)];
  render() {
    return html`<button class="btn">daisyUI button</button> `;
  }
}

window.customElements.define("my-element", MyElement);
```

--------------------------------

### DaisyUI Modal with Anchor Link (HTML)

Source: https://daisyui.com/components/modal

This HTML example implements a modal using anchor links. Clicking the 'open modal' link navigates to an anchor with the modal's ID, causing it to appear. The modal itself is a `div` with the specified ID and DaisyUI classes. Closing the modal involves linking to `#`, which scrolls the page to the top.

```html
<!-- The button to open modal -->
<a href="#my_modal_8" class="btn">open modal</a>

<!-- Put this part before </body> tag -->
<div class="modal" role="dialog" id="my_modal_8">
  <div class="modal-box">
    <h3 class="text-lg font-bold">Hello!</h3>
    <p class="py-4">This modal works with anchor links</p>
    <div class="modal-action">
      <a href="#" class="btn">Yay!</a>
    </div>
  </div>
</div>
```

--------------------------------

### DaisyUI Ghost Badge (HTML)

Source: https://daisyui.com/components/badge

Illustrates the implementation of a ghost badge using DaisyUI. The ghost style provides a minimal visual appearance for the badge, suitable for less prominent notifications or labels. The example shows a basic ghost badge.

```html
<div class="badge badge-ghost">ghost</div>
```

```jsx
<div className="badge badge-ghost">ghost</div>
```

--------------------------------

### React Centered Footer with Social Icons

Source: https://daisyui.com/components/footer

A React implementation of the centered footer component. It uses JSX syntax and includes the dynamic generation of the copyright year. This example is suitable for use within a React application.

```jsx
<footer className="footer footer-horizontal footer-center bg-base-200 text-base-content rounded p-10">
  <nav className="grid grid-flow-col gap-4">
    <a className="link link-hover">About us</a>
    <a className="link link-hover">Contact</a>
    <a className="link link-hover">Jobs</a>
    <a className="link link-hover">Press kit</a>
  </nav>
  <nav>
    <div className="grid grid-flow-col gap-4">
      <a>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          className="fill-current">
          <path
            d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z"></path>
        </svg>
      </a>
      <a>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          className="fill-current">
          <path
            d="M19.615 3.184c-3.604-.246-11.631-.245-15.23 0-3.897.266-4.356 2.62-4.385 8.816.029 6.185.484 8.549 4.385 8.816 3.6.245 11.626.246 15.23 0 3.897-.266 4.356-2.62 4.385-8.816-.029-6.185-.484-8.549-4.385-8.816zm-10.615 12.816v-8l8 3.993-8 4.007z"></path>
        </svg>
      </a>
      <a>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="24"
          height="24"
          viewBox="0 0 24 24"
          className="fill-current">
          <path
            d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z"></path>
        </svg>
      </a>
    </div>
  </nav>
  <aside>
    <p>Copyright © {new Date().getFullYear()} - All right reserved by ACME Industries Ltd</p>
  </aside>
</footer>
```

--------------------------------

### DaisyUI Accent Color Select (React)

Source: https://daisyui.com/components/select

A React example of a select dropdown styled with DaisyUI's accent color, facilitating color scheme selection. It uses React props for state management.

```jsx
<select defaultValue="Color scheme" className="select select-accent">
  <option disabled={true}>Color scheme</option>
  <option>Light mode</option>
  <option>Dark mode</option>
  <option>System</option>
</select>
```

--------------------------------

### Create Image Carousel with DaisyUI - React/JSX

Source: https://daisyui.com/components/carousel

Implements the same carousel component in React/JSX syntax using className instead of class. Suitable for React applications utilizing DaisyUI's carousel styling with automatic snap-to-start behavior for image galleries.

```jsx
<div className="carousel rounded-box">
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp"
      alt="Burger" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      alt="Burger" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      alt="Burger" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      alt="Burger" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp"
      alt="Burger" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp"
      alt="Burger" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      alt="Burger" />
  </div>
</div>
```

--------------------------------

### Link Styling within Paragraphs

Source: https://daisyui.com/components/link

This example shows how to integrate the DaisyUI 'link' class into a paragraph to style specific links within a text block, making them appear as normal links again after Tailwind CSS resets.

```html
<p>
  Tailwind CSS resets the style of links by default.
  <br />
  Add "link" class to make it look like a
  <a class="link">normal link</a>
  again.
</p>
```

```jsx
<p>
  Tailwind CSS resets the style of links by default.
  <br />
  Add "link" class to make it look like a
  <a className="link">normal link</a>
  again.
</p>
```

--------------------------------

### Responsive Card Styling (CSS)

Source: https://daisyui.com/pages/css-library-for-html

Demonstrates the process of applying responsive styles to a card component using media queries for different screen sizes (desktop, tablet, mobile). It shows how padding and display properties change based on viewport width.

```css
/* Desktop styles */
.card {
  width: 400px;
  padding: 24px;
  display: flex;
}

/* Tablet */
@media (max-width: 768px) {
  .card {
    width: 100%;
    padding: 16px;
  }
}

/* Mobile */
@media (max-width: 480px) {
  .card {
    padding: 12px;
    display: block;
  }
}
```

--------------------------------

### DaisyUI Custom Collapse Colors on Focus (HTML)

Source: https://daisyui.com/components/collapse

This example showcases a DaisyUI collapse component with custom background and text colors applied when the component is focused. It leverages Tailwind CSS 'group' and 'group-focus' utilities.

```html
<div
  tabindex="0"
  class="bg-primary text-primary-content focus:bg-secondary focus:text-secondary-content collapse"
>
  <div class="collapse-title font-semibold">How do I create an account?</div>
  <div class="collapse-content text-sm">
    Click the "Sign Up" button in the top right corner and follow the registration process.
  </div>
</div>
```

--------------------------------

### Theme Controller Toggle Input (HTML)

Source: https://daisyui.com/components/theme-controller

Example of a theme controller using an HTML checkbox input styled as a toggle. This component changes the page theme based on its checked state and the 'value' attribute. It works with CSS only.

```html
<input type="checkbox" value="synthwave" class="toggle theme-controller" />
```

```html
<input type="checkbox" value="synthwave" class="toggle theme-controller" />
```

--------------------------------

### Customizing Button with Tailwind CSS utilities

Source: https://daisyui.com/index

Illustrates how to further customize a daisyUI button by applying Tailwind CSS utility classes. This example shows how to make the button fully rounded using the 'rounded-full' class.

```html
<a class="btn btn-primary rounded-full">Button</a>
```

--------------------------------

### Stacked Cards (End Direction) HTML Example

Source: https://daisyui.com/components/stack

Illustrates stacking cards from the end of the container using DaisyUI's 'stack-end' class. This provides a reversed layering effect compared to 'stack-start', suitable for different visual compositions.

```html
<div class="stack stack-end size-28">
  <div class="border-base-content card bg-base-100 border text-center">
    <div class="card-body">A</div>
  </div>
  <div class="border-base-content card bg-base-100 border text-center">
    <div class="card-body">B</div>
  </div>
  <div class="border-base-content card bg-base-100 border text-center">
    <div class="card-body">C</div>
  </div>
</div>
```

```jsx
<div className="stack stack-end size-28">
  <div className="border-base-content card bg-base-100 border text-center">
    <div className="card-body">A</div>
  </div>
  <div className="border-base-content card bg-base-100 border text-center">
    <div className="card-body">B</div>
  </div>
  <div className="border-base-content card bg-base-100 border text-center">
    <div className="card-body">C</div>
  </div>
</div>
```

--------------------------------

### DaisyUI Secondary Color Select (React)

Source: https://daisyui.com/components/select

This React example uses DaisyUI's secondary color for a select dropdown, allowing users to choose a programming language. It employs React-specific props for control.

```jsx
<select defaultValue="Pick a language" className="select select-secondary">
  <option disabled={true}>Pick a language</option>
  <option>Zig</option>
  <option>Go</option>
  <option>Rust</option>
</select>
```

--------------------------------

### DaisyUI Checkbox Component Syntax

Source: https://daisyui.com/llms

The DaisyUI checkbox component allows users to select or deselect values. It utilizes the `checkbox` class and supports color and size modifiers. The `{MODIFIER}` can be a combination of color and size class names.

```html
<input type="checkbox" class="checkbox {MODIFIER}" />
```

--------------------------------

### Styled Vertical Timeline with Primary Color (React JSX)

Source: https://daisyui.com/components/timeline

A React JSX example demonstrating a vertical timeline styled with DaisyUI's primary color. It features SVG icons and custom-colored dividers.

```jsx
<ul className="timeline timeline-vertical">
  <li>
    <div className="timeline-start timeline-box">First Macintosh computer</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="text-primary h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <hr className="bg-primary" />
  </li>
  <li>
    <hr className="bg-primary" />
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="text-primary h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iMac</div>
    <hr className="bg-primary" />
  </li>
  <li>
    <hr className="bg-primary" />
    <div className="timeline-start timeline-box">iPod</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="text-primary h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iPhone</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-start timeline-box">Apple Watch</div>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
  </li>
</ul>
```

--------------------------------

### Display Radial Progress with Different Values

Source: https://daisyui.com/components/radial-progress

Demonstrates how to set the radial progress component to various percentage values. Each example shows a different `--value` CSS variable to represent distinct progress levels from 0% to 100%.

```html
<div class="radial-progress" style="--value:0;" aria-valuenow="0" role="progressbar">0%</div>
<div class="radial-progress" style="--value:20;" aria-valuenow="20" role="progressbar">20%</div>
<div class="radial-progress" style="--value:60;" aria-valuenow="60" role="progressbar">60%</div>
<div class="radial-progress" style="--value:80;" aria-valuenow="80" role="progressbar">80%</div>
<div class="radial-progress" style="--value:100;" aria-valuenow="100" role="progressbar">100%</div>
```

```tsx
import React from 'react';

// ... other components

<div className="radial-progress" style={{ "--value": 0 } as React.CSSProperties}
  aria-valuenow={0} role="progressbar">0%</div>

<div className="radial-progress" style={{ "--value": 20 } as React.CSSProperties}
aria-valuenow={20} role="progressbar">20%</div>

<div className="radial-progress" style={{ "--value": 60 } as React.CSSProperties}
  aria-valuenow={60} role="progressbar">60%</div>

<div className="radial-progress" style={{ "--value": 80 } as React.CSSProperties}
  aria-valuenow={80} role="progressbar">80%</div>

<div className="radial-progress" style={{ "--value": 100 } as React.CSSProperties}
  aria-valuenow={100} role="progressbar">100%</div>
```

--------------------------------

### Update Form Control Structure to Fieldset and Legend in HTML

Source: https://daisyui.com/docs/upgrade

Migrate from deprecated form-control, label-text, and label-text-alt classes to semantic HTML5 fieldset and legend elements with DaisyUI fieldset class for improved accessibility and styling.

```html
before
<label class="form-control w-full max-w-xs">
  Login
  <div class="label">
    <span class="label-text">Name</span>
  </div>
  <input class="input" placeholder="Name" />
</label>

after
<fieldset class="fieldset">
  <legend>Login</legend>
  <label class="label" for="name">Name</label>
  <input id="name" class="input" placeholder="Name" />
</fieldset>
```

--------------------------------

### Indicator Middle End Positioning (HTML)

Source: https://daisyui.com/components/indicator

Demonstrates the default 'indicator-middle' and 'indicator-end' positioning for a DaisyUI indicator. This setup places a secondary badge indicator in the middle and to the right of the content. No external dependencies are required beyond DaisyUI.

```html
<div class="indicator">
  <span class="indicator-item indicator-middle badge badge-secondary"></span>
  <div class="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

```jsx
<div className="indicator">
  <span className="indicator-item indicator-middle badge badge-secondary"></span>
  <div className="bg-base-300 grid h-32 w-32 place-items-center">content</div>
</div>
```

--------------------------------

### Basic DaisyUI Timeline Structure

Source: https://daisyui.com/components/timeline

This snippet shows the fundamental structure of a DaisyUI timeline. It uses a ul element with the 'timeline' class. Each list item represents an event in the timeline and contains elements for the start, middle, and end of the event.

```html
<ul class="timeline">
  <li>
    <div class="timeline-start timeline-box">Apple</div>
    <div class="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="h-5 w-5"
      >
        <path
          fill-rule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clip-rule="evenodd"
        />
      </svg>
    </div>
    <div class="timeline-end timeline-box">iPhone</div>
    <hr />
  </li>
  <li>
    <hr />
    <div class="timeline-start timeline-box">Apple Watch</div>
    <div class="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        class="h-5 w-5"
      >
        <path
          fill-rule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clip-rule="evenodd"
        />
      </svg>
    </div>
  </li>
</ul>
```

--------------------------------

### Chat Bubble with Start and End Alignment - JSX

Source: https://daisyui.com/components/chat

React/JSX implementation of chat bubbles using className instead of class attribute. Demonstrates the same conversation layout with proper JSX syntax for component-based development.

```jsx
<div className="chat chat-start">
  <div className="chat-bubble">
    It's over Anakin,
    <br />
    I have the high ground.
  </div>
</div>
<div className="chat chat-end">
  <div className="chat-bubble">You underestimate my power!</div>
</div>
```

--------------------------------

### Create Data Table with Optional Modifiers

Source: https://daisyui.com/llms

Display tabular data with responsive horizontal scrolling on smaller screens. Supports optional modifiers for zebra striping (table-zebra), pinned rows/columns, and various size options from extra-small to extra-large.

```html
<div class="overflow-x-auto">
  <table class="table {MODIFIER}">
    <thead>
      <tr>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th></th>
      </tr>
    </tbody>
  </table>
</div>
```

--------------------------------

### Create Timeline Component for Chronological Events

Source: https://daisyui.com/llms

Display events in chronological order using timeline component with directional layout options (vertical or horizontal). Supports positioning variants (timeline-start, timeline-middle, timeline-end) and display modifiers (timeline-snap-icon, timeline-box, timeline-compact).

```html
<div class="timeline">
  <!-- timeline items with timeline-start, timeline-middle, timeline-end parts -->
</div>
```

--------------------------------

### Button with Icon (JSX)

Source: https://daisyui.com/components/button

Illustrates how to implement buttons with leading or trailing icons in a React environment using DaisyUI classes. This JSX example uses `className` for styling and assumes SVG components are correctly imported or defined.

```jsx
<button className="btn">
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2.5" stroke="currentColor" className="size-[1.2em]"><path strokeLinecap="round" strokeLinejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" /></svg>
  Like
</button>
<button className="btn">
  Like
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth="2.5" stroke="currentColor" className="size-[1.2em]"><path strokeLinecap="round" strokeLinejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" /></svg>
</button>
```

--------------------------------

### Activate Swap with Class Name (HTML)

Source: https://daisyui.com/components/swap

Shows how to activate the DaisyUI swap component by adding the `swap-active` class, instead of relying on a checkbox. This allows for programmatic control of the swap state using JavaScript. Two examples are provided, one inactive and one active.

```html
<label class="swap text-6xl">
  <div class="swap-on">🥵</div>
  <div class="swap-off">🥶</div>
</label>
<label class="swap swap-active text-6xl">
  <div class="swap-on">🥳</div>
  <div class="swap-off">😭</div>
</label>
```

```html
<label className="swap text-6xl">
  <div className="swap-on">🥵</div>
  <div className="swap-off">🥶</div>
</label>
<label className="swap swap-active text-6xl">
  <div className="swap-on">🥳</div>
  <div className="swap-off">😭</div>
</label>
```

--------------------------------

### DaisyUI Error Progress Bar Examples

Source: https://daisyui.com/components/progress

Demonstrates the usage of the error color variant for the DaisyUI progress bar. This is useful for indicating failure states or critical issues. It accepts a 'value' attribute to show progress and a 'max' attribute for the maximum value.

```html
<progress class="progress progress-error w-56" value="0" max="100"></progress>
<progress class="progress progress-error w-56" value="10" max="100"></progress>
<progress class="progress progress-error w-56" value="40" max="100"></progress>
<progress class="progress progress-error w-56" value="70" max="100"></progress>
<progress class="progress progress-error w-56" value="100" max="100"></progress>
```

```jsx
<progress className="progress progress-error w-56" value={0} max="100"></progress>
<progress className="progress progress-error w-56" value="10" max="100"></progress>
<progress className="progress progress-error w-56" value="40" max="100"></progress>
<progress className="progress progress-error w-56" value="70" max="100"></progress>
<progress className="progress progress-error w-56" value="100" max="100"></progress>
```

--------------------------------

### CSS Dark Mode and Theme Support Implementation

Source: https://daisyui.com/pages/ui-library-for-hackaton

Illustrates the complexity of implementing dark mode support using CSS media queries and data attributes. Shows how to manage light/dark theme variants for components, requiring duplicate CSS rules and manual theme toggle support, which multiplies maintenance overhead across all UI elements.

```css
.card {
  background-color: #ffffff;
  border: 1px solid #e5e7eb;
  color: #111827;
}

@media (prefers-color-scheme: dark) {
  .card {
    background-color: #1f2937;
    border: 1px solid #374151;
    color: #f9fafb;
  }
}

[data-theme="dark"] .card {
  background-color: #1f2937;
  border: 1px solid #374151;
  color: #f9fafb;
}
```

--------------------------------

### CSS Color Variables - Before daisyUI 5

Source: https://daisyui.com/docs/v5

Previous daisyUI color variable implementation using abbreviated variable names in oklch space format. Colors were stored as individual lightness, chroma, and hue components making them difficult to read and customize in browser developer tools.

```css
/* hard to read variable names, hard to customize values */
{
--b1: 100% 0 0;
--b2: 96.1151% 0 0;
--b3: 92.4169% .00108 197.137559;
--bc: 27.8078% .029596 256.847952;
--p: 49.12% .3096 275.75;
--pc: 89.824% .06192 275.75;
--s: 69.71% .329 342.55;
--sc: 98.71% .0106 342.55;
--a: 76.76% .184 183.61;
--ac: 15.352% .0368 183.61;
--n: 32.1785% .02476 255.701624;
--nc: 89.4994% .011585 252.096176;
--in: 72.06% .191 231.6;
--inc: 0% 0 0;
--su: 64.8% .15 160;
--suc: 0% 0 0;
--wa: 84.71% .199 83.87;
--wac: 0% 0 0;
--er: 71.76% .221 22.18;
--erc: 0% 0 0;
}
```

--------------------------------

### Navbar with Colors (React JSX)

Source: https://daisyui.com/components/navbar

Demonstrates applying different background and text colors to a DaisyUI navbar within a React JSX environment. This example uses 'bg-neutral', 'bg-base-300', and 'bg-primary' for varied color schemes.

```jsx
<div className="navbar bg-neutral text-neutral-content">
  <button className="btn btn-ghost text-xl">daisyUI</button>
</div>

<div className="navbar bg-base-300">
  <button className="btn btn-ghost text-xl">daisyUI</button>
</div>

<div className="navbar bg-primary text-primary-content">
  <button className="btn btn-ghost text-xl">daisyUI</button>
</div>
```

--------------------------------

### Configure Tailwind CSS in Nuxt Vite Config

Source: https://daisyui.com/docs/install/nuxt

Adds the Tailwind CSS Vite plugin to the Nuxt configuration file (`nuxt.config.ts`). This enables Tailwind CSS processing within the Vite build process for the Nuxt project.

```typescript
import tailwindcss from "@tailwindcss/vite";
export default defineNuxtConfig({
  vite: {
    plugins: [tailwindcss()],
  },
  css: ["./app/tailwind.css"],
});
```

--------------------------------

### DaisyUI Neutral Color Select (React)

Source: https://daisyui.com/components/select

This React example utilizes DaisyUI's neutral color for a select dropdown, allowing users to pick a server location. It's configured using React props.

```jsx
<select defaultValue="Server location" className="select select-neutral">
  <option disabled={true}>Server location</option>
  <option>North America</option>
  <option>EU west</option>
  <option>South East Asia</option>
</select>
```

--------------------------------

### React Hover Gallery Example

Source: https://daisyui.com/components/hover-gallery

This React code demonstrates how to implement the daisyUI Hover Gallery component within a React application. It utilizes JSX syntax with className for applying the 'hover-gallery' class to a `<figure>` element. Similar to the HTML version, it allows for sequential image display on horizontal hover and supports up to 10 images.

```jsx
<figure className="hover-gallery max-w-60">
  <img src="https://img.daisyui.com/images/stock/daisyui-hat-1.webp" />
  <img src="https://img.daisyui.com/images/stock/daisyui-hat-2.webp" />
  <img src="https://img.daisyui.com/images/stock/daisyui-hat-3.webp" />
  <img src="https://img.daisyui.com/images/stock/daisyui-hat-4.webp" />
</figure>
```

--------------------------------

### Theme Controller Toggle Input (React)

Source: https://daisyui.com/components/theme-controller

Example of a theme controller using a React checkbox input styled as a toggle. This component changes the page theme based on its checked state and the 'value' attribute. It works with CSS only.

```jsx
<input type="checkbox" value="synthwave" className="toggle theme-controller" />
```

```jsx
<input type="checkbox" value="synthwave" className="toggle theme-controller" />
```

--------------------------------

### DaisyUI Alert Component - Info Color React

Source: https://daisyui.com/components/alert

This React snippet displays an info-colored DaisyUI alert. Similar to the HTML version, it uses the `alert-info` class and `stroke-current` for the icon. This example is tailored for React projects.

```jsx
<div role="alert" className="alert alert-info">
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" className="h-6 w-6 shrink-0 stroke-current">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
  </svg>
  <span>New software update available.</span>
</div>
```

--------------------------------

### Migrate Tab Component Class Names in HTML

Source: https://daisyui.com/docs/upgrade

Update DaisyUI Tab component class names from deprecated to new naming conventions. This applies to tabs-bordered, tabs-lifted, and tabs-boxed classes which have been renamed to tabs-border, tabs-lift, and tabs-box respectively.

```html
- <div class="tabs tabs-bordered">
+ <div class="tabs tabs-border">
```

```html
- <div class="tabs tabs-lifted">
+ <div class="tabs tabs-lift">
```

```html
- <div class="tabs tabs-boxed">
+ <div class="tabs tabs-box">
```

--------------------------------

### Configure Vite for Tailwind CSS in Ember

Source: https://daisyui.com/docs/install/ember

Integrates Tailwind CSS into the Vite configuration file (`vite.config.mjs`) for an Ember project. It adds the tailwindcss plugin and ensures compatibility with Ember's build process via @embroider/vite plugins.

```javascript
  import { defineConfig } from 'vite';
  import { extensions, classicEmberSupport, ember } from '@embroider/vite';
  import { babel } from '@rollup/plugin-babel';
+ import tailwindcss from '@tailwindcss/vite';

  export default defineConfig({
    plugins: [
+     tailwindcss(),
      classicEmberSupport(),
      ember(),
      // extra plugins here
      babel({
        babelHelpers: 'runtime',
        extensions,
      }),
    ],
  });
```

--------------------------------

### DaisyUI Radio Button with Primary Color (HTML)

Source: https://daisyui.com/components/radio

Demonstrates the usage of the primary color variant for DaisyUI radio buttons, achieved by applying the 'radio-primary' class. This example shows a checked and an unchecked primary radio button.

```html
<input type="radio" name="radio-4" class="radio radio-primary" checked="checked" />
<input type="radio" name="radio-4" class="radio radio-primary" />
```

--------------------------------

### Using Mary UI Components in Laravel Blade

Source: https://daisyui.com/blog/mary-ui

Demonstrates how to use Mary UI's pre-built components like forms, inputs, and buttons within a Laravel blade file using Livewire syntax. This example showcases input fields with labels, prefixes, and monetary formatting, alongside action buttons with primary styling and a submit spinner.

```html
<x-form wire:submit="save">
  <x-input label="Name" wire:model="name" />
  <x-input
    label="Amount"
    wire:model="amount"
    prefix="USD"
    money
    hint="It submits an unmasked value" />
  <x-slot:actions>
    <x-button label="Cancel" />
    <x-button label="Click me!" class="btn-primary" type="submit" spinner="save" />
  </x-slot:actions>
</x-form>
```

--------------------------------

### JavaScript Build Pipeline Commands

Source: https://daisyui.com/pages/best-component-library-for-2026

This is a typical sequence of commands for building a modern JavaScript application. It demonstrates the complexity and time-consuming nature of build processes, contributing to slow development cycles and debugging challenges.

```bash
# Typical modern build pipeline
npm run build:css
npm run build:js 
npm run optimize:images
npm run bundle:analyze
npm run test:unit
npm run test:e2e
npm run build:prod

# Total build time: 3-8 minutes for a medium-sized app
```

--------------------------------

### DaisyUI Dock with Custom Neutral Colors

Source: https://daisyui.com/components/dock

This example shows a basic dock component with buttons for Home, Inbox, and Settings. It utilizes DaisyUI's neutral color scheme for the dock's background and text, providing a subtle and clean appearance. The 'Inbox' button is marked as active using the 'dock-active' class.

```html
<div class="dock bg-neutral text-neutral-content">
  <button>
    <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" stroke-linejoin="miter" stroke-linecap="butt"><polyline points="1 11 12 2 23 11" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="2"></polyline><path d="m5,13v7c0,1.105.895,2,2,2h10c1.105,0,2-.895,2-2v-7" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></path><line x1="12" y1="22" x2="12" y2="18" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></line></g></svg>
    <span class="dock-label">Home</span>
  </button>
  
  <button class="dock-active">
    <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" stroke-linejoin="miter" stroke-linecap="butt"><polyline points="3 14 9 14 9 17 15 17 15 14 21 14" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="2"></polyline><rect x="3" y="3" width="18" height="18" rx="2" ry="2" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></rect></g></svg>
    <span class="dock-label">Inbox</span>
  </button>
  
  <button>
    <svg class="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" stroke-linejoin="miter" stroke-linecap="butt"><circle cx="12" cy="12" r="3" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></circle><path d="m22,13.25v-2.5l-2.318-.966c-.167-.581-.395-1.135-.682-1.654l.954-2.318-1.768-1.768-2.318.954c-.518-.287-1.073-.515-1.654-.682l-.966-2.318h-2.5l-.966,2.318c-.581.167-1.135.395-1.654.682l-2.318-.954-1.768,1.768.954,2.318c-.287.518-.515,1.073-.682,1.654l-2.318.966v2.5l2.318.966c.167.581.395,1.135.682,1.654l-.954,2.318,1.768,1.768,2.318-.954c.518.287,1.073.515,1.654.682l.966,2.318h2.5l.966-2.318c.581-.167,1.135-.395,1.654-.682l2.318.954,1.768-1.768-.954-2.318c.287-.518.515-1.073.682-1.654l2.318-.966Z" fill="none" stroke="currentColor" stroke-linecap="square" stroke-miterlimit="10" stroke-width="2"></path></g></svg>
    <span class="dock-label">Settings</span>
  </button>
</div>
```

--------------------------------

### HTML Navbar with Start/End Icons

Source: https://daisyui.com/components/navbar

This HTML snippet demonstrates a navbar component with icons at the start and end. It uses DaisyUI classes for styling and layout. The navbar includes a button with a menu icon on the left and a button with a more options icon on the right, flanking the site title.

```html
<div class="navbar bg-base-100 shadow-sm">
  <div class="flex-none">
    <button class="btn btn-square btn-ghost">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block h-5 w-5 stroke-current"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path> </svg>
    </button>
  </div>
  <div class="flex-1">
    <a class="btn btn-ghost text-xl">daisyUI</a>
  </div>
  <div class="flex-none">
    <button class="btn btn-square btn-ghost">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block h-5 w-5 stroke-current"> <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path> </svg>
    </button>
  </div>
</div>
```

--------------------------------

### DaisyUI Accent Color Progress Bar (React)

Source: https://daisyui.com/components/progress

Provides an example of a progress bar with an accent color theme in a React component using DaisyUI. It uses `className` for styling and JavaScript expressions within curly braces for the `value` attribute. Ensure DaisyUI is available in your React build.

```jsx
<progress className="progress progress-accent w-56" value={0} max="100"></progress>
<progress className="progress progress-accent w-56" value="10" max="100"></progress>
<progress className="progress progress-accent w-56" value="40" max="100"></progress>
<progress className="progress progress-accent w-56" value="70" max="100"></progress>
<progress className="progress progress-accent w-56" value="100" max="100"></progress>
```

--------------------------------

### HTML Full-bleed Carousel with Images

Source: https://daisyui.com/components/carousel

This snippet shows a basic implementation of a full-bleed carousel using DaisyUI. It utilizes the `carousel` and `carousel-item` classes to structure the carousel and displays a series of images. The carousel is styled with a neutral background and rounded corners.

```html
<div class="carousel carousel-center bg-neutral rounded-box max-w-md space-x-4 p-4">
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp"
      class="rounded-box" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      class="rounded-box" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      class="rounded-box" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      class="rounded-box" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp"
      class="rounded-box" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp"
      class="rounded-box" />
  </div>
  <div class="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      class="rounded-box" />
  </div>
</div>
```

--------------------------------

### Configure daisyUI Class Name Prefix

Source: https://daisyui.com/docs/config

Explains how to set a custom prefix for all daisyUI class names using the `prefix` option. This helps in avoiding class name collisions with other CSS frameworks or custom styles. Example shows `btn` becoming `d-btn`.

```css
@plugin "daisyui" {
  prefix: "d-";
}
```

--------------------------------

### Divider in Different Positions

Source: https://daisyui.com/components/divider

This snippet demonstrates how to control the alignment of DaisyUI dividers. It shows dividers positioned at the start, the default center position, and the end of their container. This is achieved using the `divider-start` and `divider-end` utility classes.

```html
<div class="flex w-full flex-col">
  <div class="divider divider-start">Start</div>
  <div class="divider">Default</div>
  <div class="divider divider-end">End</div>
</div>
```

```jsx
<div className="flex w-full flex-col">
  <div className="divider divider-start">Start</div>
  <div className="divider">Default</div>
  <div className="divider divider-end">End</div>
</div>
```

--------------------------------

### Calendar Component for Cally, Pikaday, and React Day Picker

Source: https://daisyui.com/llms

DaisyUI provides styles for various calendar libraries. It includes specific classes for the Cally web component ('cally'), the Pikaday input field ('pika-single'), and the React Day Picker component ('react-day-picker').

```html
<!-- For Cally -->
<calendar-date class="cally">{CONTENT}</calendar-date>

<!-- For Pikaday -->
<input type="text" class="input pika-single">

<!-- For React Day Picker -->
<DayPicker className="react-day-picker">
```

--------------------------------

### Update Tailwind CSS Configuration

Source: https://daisyui.com/docs/upgrade

Before running the Tailwind CSS upgrade tool, remove daisyUI themes and plugins from your `tailwind.config.js` file. This ensures the upgrade tool can safely replace daisyUI-specific configurations with standard CSS file references.

```javascript
module.exports = {
   content: ['./your-files/**/*.{html,js}'],
   // other stuff...
-  daisyui: {
-    themes: ['light', 'dark', 'cupcake'],
-  },
- plugins: [require("daisyui")],
}
```

--------------------------------

### Dropdown Bottom Center Alignment (JSX)

Source: https://daisyui.com/components/dropdown

Provides a JSX example for a dropdown menu aligned to the bottom and center of its trigger button. This implementation is suitable for React applications and uses corresponding className attributes for DaisyUI styling.

```jsx
<div className="dropdown dropdown-bottom dropdown-center">
  <div tabIndex={0} role="button" className="btn m-1">Click ⬇️</div>
  <ul tabIndex="-1" className="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

--------------------------------

### DaisyUI Dock Small Size React Example

Source: https://daisyui.com/components/dock

This React JSX snippet demonstrates the small-sized DaisyUI dock component. It utilizes className for styling and includes SVG icons within buttons, with one button marked as 'dock-active'.

```jsx
<div className="dock dock-sm">
  <button>
    <svg className="size-[1.2em]" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" strokeLinejoin="miter" strokeLinecap="butt"><polyline points="1 11 12 2 23 11" fill="none" stroke="currentColor" stroke-miterlimit="10" strokeWidth="2"></polyline><path d="m5,13v7c0,1.105.895,2,2,2h10c1.105,0,2-.895,2-2v-7" fill="none" stroke="currentColor" strokeLinecap="square" stroke-miterlimit="10" strokeWidth="2"></path><line x1="12" y1="22" x2="12" y2="18" fill="none" stroke="currentColor" strokeLinecap="square" stroke-miterlimit="10" strokeWidth="2"></line></g></svg>
  </button>
  
  <button className="dock-active">

```

--------------------------------

### Window Mockup with Background Color - React

Source: https://daisyui.com/components/mockup-window

This React code snippet demonstrates how to create a window mockup with a background color in a React environment using daisyUI classes. It allows for easy customization of the window's appearance.

```jsx
<div className="mockup-window bg-base-100 border border-base-300">
  <div className="grid place-content-center h-80">Hello!</div>
</div>
```

--------------------------------

### DaisyUI Footer Component (React JSX)

Source: https://daisyui.com/components/footer

Provides an example of implementing the daisyUI footer component within a React application using JSX. It mirrors the HTML structure, applying daisyUI classes for styling and layout. The `sm:footer-horizontal` class ensures responsive horizontal arrangement.

```jsx
<footer className="footer sm:footer-horizontal bg-neutral text-neutral-content p-10">
  <nav>
    <h6 className="footer-title">Services</h6>
    <a className="link link-hover">Branding</a>
    <a className="link link-hover">Design</a>
    <a className="link link-hover">Marketing</a>
    <a className="link link-hover">Advertisement</a>
  </nav>
  <nav>
    <h6 className="footer-title">Company</h6>
    <a className="link link-hover">About us</a>
    <a className="link link-hover">Contact</a>
    <a className="link link-hover">Jobs</a>
    <a className="link link-hover">Press kit</a>
  </nav>
  <nav>
    <h6 className="footer-title">Legal</h6>
    <a className="link link-hover">Terms of use</a>
    <a className="link link-hover">Privacy policy</a>
    <a className="link link-hover">Cookie policy</a>
  </nav>
</footer>
```

--------------------------------

### Basic DaisyUI Code Mockup

Source: https://daisyui.com/components/mockup-code

Displays a single line of code within a styled code block. This is useful for showing commands or short code snippets. It utilizes the `mockup-code` class and a `pre` tag with an optional `data-prefix` attribute.

```html
<div class="mockup-code w-full">
  <pre data-prefix="$"><code>npm i daisyui</code></pre>
</div>
```

```html
<div className="mockup-code w-full">
  <pre data-prefix="$"><code>npm i daisyui</code></pre>
</div>
```

--------------------------------

### Basic DaisyUI Countdown Example (HTML)

Source: https://daisyui.com/components/countdown

A simple DaisyUI countdown component displaying a single digit with a transition effect. It requires JavaScript to update the `--value` CSS variable and the span text. The value must be between 0 and 999.

```html
<span class="countdown">
  <span style="--value:59;" aria-live="polite" aria-label="59">59</span>
</span>
```

--------------------------------

### Build Carousel with Indicator Buttons in HTML

Source: https://daisyui.com/components/carousel

Creates a full-width carousel container with multiple image items and anchor-link based indicator buttons. Each carousel item is identified with unique IDs that correspond to button href attributes, allowing browser-native snap scrolling when buttons are clicked.

```HTML
<div class="carousel w-full">
  <div id="item1" class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1625726411847-8cbb60cc71e6.webp"
      class="w-full" />
  </div>
  <div id="item2" class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1609621838510-5ad474b7d25d.webp"
      class="w-full" />
  </div>
  <div id="item3" class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1414694762283-acccc27bca85.webp"
      class="w-full" />
  </div>
  <div id="item4" class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1665553365602-b2fb8e5d1707.webp"
      class="w-full" />
  </div>
</div>
<div class="flex w-full justify-center gap-2 py-2">
  <a href="#item1" class="btn btn-xs">1</a>
  <a href="#item2" class="btn btn-xs">2</a>
  <a href="#item3" class="btn btn-xs">3</a>
  <a href="#item4" class="btn btn-xs">4</a>
</div>
```

--------------------------------

### Create Text Rotation Animation Component

Source: https://daisyui.com/llms

Display up to 6 lines of text that rotate through a continuous loop with 10-second default duration. Animation pauses on hover. Supports custom durations via utility classes and styling for individual words with colors and backgrounds.

```html
<span class="text-rotate">
  <span>
    <span>Word 1</span>
    <span>Word 2</span>
    <span>Word 3</span>
    <span>Word 4</span>
    <span>Word 5</span>
    <span>Word 6</span>
  </span>
</span>
```

```html
<span class="text-rotate max-md:text-3xl text-7xl font-title">
  <span class="justify-items-center">
    <span>DESIGN</span>
    <span>DEVELOP</span>
    <span>DEPLOY</span>
    <span>SCALE</span>
    <span>MAINTAIN</span>
    <span>REPEAT</span>
  </span>
</span>
```

```html
<span>
  Providing AI Agents for 
  <span class="text-rotate">
    <span>
      <span class="bg-teal-400 text-teal-800 px-2">Designers</span>
      <span class="bg-red-400 text-red-800 px-2">Developers</span>
      <span class="bg-blue-400 text-blue-800 px-2">Managers</span>
    </span>
  </span>
</span>
```

```html
<span class="text-rotate max-md:text-3xl text-7xl font-title leading-[2]">
  <span class="justify-items-center">
    <span>📐 DESIGN</span>
    <span>⌨️ DEVELOP</span>
    <span>🌎 DEPLOY</span>
    <span>🌱 SCALE</span>
    <span>🔧 MAINTAIN</span>
    <span>♻️ REPEAT</span>
  </span>
</span>
```

--------------------------------

### HTML Dialog Modal with Backdrop Close

Source: https://daisyui.com/components/modal

This modal example uses the HTML `<dialog>` element and includes a `modal-backdrop` class. Clicking outside the modal content area (on the backdrop) will close the modal, providing a common user interaction pattern.

```html
<!-- Open the modal using ID.showModal() method -->
<button class="btn" onclick="my_modal_1.showModal()">open modal</button>
<dialog id="my_modal_1" class="modal">
  <div class="modal-box">
    <h3 class="text-lg font-bold">Hello!</h3>
    <p class="py-4">Press ESC key or click the button below to close</p>
    <div class="modal-action">
      <form method="dialog">
        <!-- if there is a button in form, it will close the modal -->
        <button class="btn">Close</button>
      </form>
    </div>
  </div>
  <form method="dialog" class="modal-backdrop">
    <button>close</button>
  </form>
</dialog>
```

--------------------------------

### Dropdown with Details and Summary (HTML)

Source: https://daisyui.com/components/dropdown

This snippet demonstrates creating a dropdown component using native HTML 'details' and 'summary' elements combined with daisyUI classes. The dropdown is triggered by clicking the summary, and its content is defined within the details tag. This method relies on standard HTML behavior for toggling visibility.

```html
<details class="dropdown">
  <summary class="btn m-1">open or close</summary>
  <ul class="menu dropdown-content bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</details>
```

--------------------------------

### HTML Scrollable Steps Example

Source: https://daisyui.com/components/steps

This snippet shows a basic implementation of scrollable steps using DaisyUI. The steps are contained within a div with the 'overflow-x-auto' class, allowing horizontal scrolling if the content exceeds the viewport width. It utilizes various step states like 'step-secondary', 'step-accent', 'step-error', 'step-warning', and 'step-neutral' to indicate progress or status.

```html
<div class="overflow-x-auto">
  <ul class="steps">
    <li class="step">start</li>
    <li class="step step-secondary">2</li>
    <li class="step step-secondary">3</li>
    <li class="step step-secondary">4</li>
    <li class="step">5</li>
    <li class="step step-accent">6</li>
    <li class="step step-accent">7</li>
    <li class="step">8</li>
    <li class="step step-error">9</li>
    <li class="step step-error">10</li>
    <li class="step">11</li>
    <li class="step">12</li>
    <li class="step step-warning">13</li>
    <li class="step step-warning">14</li>
    <li class="step">15</li>
    <li class="step step-neutral">16</li>
    <li class="step step-neutral">17</li>
    <li class="step step-neutral">18</li>
    <li class="step step-neutral">19</li>
    <li class="step step-neutral">20</li>
    <li class="step step-neutral">21</li>
    <li class="step step-neutral">22</li>
    <li class="step step-neutral">23</li>
    <li class="step step-neutral">end</li>
  </ul>
</div>
```

--------------------------------

### Replace Table Hover Class with Utility Classes in HTML

Source: https://daisyui.com/docs/upgrade

Remove the deprecated hover class from table rows and replace it with DaisyUI utility classes like hover:bg-base-300 for better control over hover styling.

```html
- <tr class="hover">
+ <tr class="hover:bg-base-300">
```

--------------------------------

### Create a Button with Tailwind UI

Source: https://daisyui.com/blog/daisyui-vs-tailwindui

Illustrates how to create a button using Tailwind CSS's utility classes. This approach involves more verbose class names for styling.

```html
<button
  class="rounded-md bg-indigo-600 px-3.5 py-2.5
  text-sm font-semibold text-white shadow-sm
  hover:bg-indigo-500 focus-visible:outline
  focus-visible:outline-2 focus-visible:outline-offset-2
  focus-visible:outline-indigo-600">
  Button
</button>
```

--------------------------------

### DaisyUI Rating Component Sizes (HTML)

Source: https://daisyui.com/components/rating

This snippet showcases the HTML structure for different sizes of the DaisyUI rating component. It includes examples for xs, sm, md, lg, and xl sizes, demonstrating how to apply the respective CSS classes to achieve the desired visual output. No external JavaScript dependencies are required for basic rendering.

```html
<!-- xs -->
<div class="rating rating-xs">
  <input type="radio" name="rating-5" class="mask mask-star-2 bg-orange-400" aria-label="1 star" />
  <input type="radio" name="rating-5" class="mask mask-star-2 bg-orange-400" aria-label="2 star" checked="checked" />
  <input type="radio" name="rating-5" class="mask mask-star-2 bg-orange-400" aria-label="3 star" />
  <input type="radio" name="rating-5" class="mask mask-star-2 bg-orange-400" aria-label="4 star" />
  <input type="radio" name="rating-5" class="mask mask-star-2 bg-orange-400" aria-label="5 star" />
</div>
<!-- sm -->
<div class="rating rating-sm">
  <input type="radio" name="rating-6" class="mask mask-star-2 bg-orange-400" aria-label="1 star" />
  <input type="radio" name="rating-6" class="mask mask-star-2 bg-orange-400" aria-label="2 star" checked="checked" />
  <input type="radio" name="rating-6" class="mask mask-star-2 bg-orange-400" aria-label="3 star" />
  <input type="radio" name="rating-6" class="mask mask-star-2 bg-orange-400" aria-label="4 star" />
  <input type="radio" name="rating-6" class="mask mask-star-2 bg-orange-400" aria-label="5 star" />
</div>
<!-- md -->
<div class="rating rating-md">
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="1 star" />
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="2 star" checked="checked" />
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="3 star" />
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="4 star" />
  <input type="radio" name="rating-7" class="mask mask-star-2 bg-orange-400" aria-label="5 star" />
</div>
<!-- lg -->
<div class="rating rating-lg">
  <input type="radio" name="rating-8" class="mask mask-star-2 bg-orange-400" aria-label="1 star" />
  <input type="radio" name="rating-8" class="mask mask-star-2 bg-orange-400" aria-label="2 star" checked="checked" />
  <input type="radio" name="rating-8" class="mask mask-star-2 bg-orange-400" aria-label="3 star" />
  <input type="radio" name="rating-8" class="mask mask-star-2 bg-orange-400" aria-label="4 star" />
  <input type="radio" name="rating-8" class="mask mask-star-2 bg-orange-400" aria-label="5 star" />
</div>
<!-- xl -->
<div class="rating rating-xl">
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="1 star" />
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="2 star" checked="checked" />
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="3 star" />
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="4 star" />
  <input type="radio" name="rating-9" class="mask mask-star-2 bg-orange-400" aria-label="5 star" />
</div>
```

--------------------------------

### Customize Border Size using CSS Variable

Source: https://daisyui.com/docs/v5

The border size for various components like buttons and inputs is customizable using the '--border' CSS variable. This allows for consistent border styling across the project.

```css
:root {
  --border: 2px; /* Example: Sets border width */
}
```

--------------------------------

### DaisyUI Alert Component (HTML)

Source: https://daisyui.com/llms

Renders an alert message using the 'alert' component in DaisyUI. Various styles like 'alert-outline', 'alert-dash', and 'alert-soft' can be applied, along with color variants ('alert-info', 'alert-success', etc.) and layout directions ('alert-vertical', 'alert-horizontal'). Responsive adjustments can be made using utility classes like 'sm:alert-horizontal'.

```html
<div role="alert" class="alert {MODIFIER}">{CONTENT}</div>
```

--------------------------------

### DaisyUI Hover Gallery Component

Source: https://daisyui.com/llms

The hover-gallery component acts as a container for multiple images, displaying one by default and revealing others on horizontal hover. It's suitable for product displays or image showcases and can accommodate up to 10 images. The component itself is marked with the 'hover-gallery' class.

```html
<div class="hover-gallery">
  <img src="https://img.daisyui.com/images/stock/photo-1507358522786-5576f8843bad.jpg" alt="Product Image 1" />
  <img src="https://img.daisyui.com/images/stock/photo-1507358522786-5576f8843bad.jpg" alt="Product Image 2" />
  <img src="https://img.daisyui.com/images/stock/photo-1507358522786-5576f8843bad.jpg" alt="Product Image 3" />
  <img src="https://img.daisyui.com/images/stock/photo-1507358522786-5576f8843bad.jpg" alt="Product Image 4" />
  <img src="https://img.daisyui.com/images/stock/photo-1507358522786-5576f8843bad.jpg" alt="Product Image 5" />
</div>
```

--------------------------------

### React Full-bleed Carousel with Images

Source: https://daisyui.com/components/carousel

This snippet demonstrates how to implement a full-bleed carousel in a React environment using DaisyUI. It uses JSX syntax with `className` instead of `class` for DaisyUI utility classes. The structure is identical to the HTML version, ensuring a consistent carousel display.

```jsx
<div className="carousel carousel-center bg-neutral rounded-box max-w-md space-x-4 p-4">
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp"
      className="rounded-box" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      className="rounded-box" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      className="rounded-box" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      className="rounded-box" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp"
      className="rounded-box" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp"
      className="rounded-box" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      className="rounded-box" />
  </div>
</div>
```

--------------------------------

### Badge Component with Styles, Colors, and Sizes

Source: https://daisyui.com/llms

Badges are used to inform users about the status of specific data. They can be styled with outline, dash, soft, or ghost variants, and colored with neutral, primary, secondary, accent, info, success, warning, or error classes. Sizes range from extra-small to extra-large. Modifiers are optional.

```html
<span class="badge badge-primary badge-outline badge-lg">Badge</span>
```

--------------------------------

### Configure daisyUI in Tailwind CSS config

Source: https://daisyui.com/blog/what-is-daisyui

Add daisyUI to the plugins array in your tailwind.config.js file. This enables all daisyUI component classes to be available in your Tailwind CSS project. The configuration allows Tailwind to process and include daisyUI's component class definitions.

```javascript
module.exports = {
  //...
  plugins: [require("daisyui")],
}
```

--------------------------------

### Apply Custom Color to Radial Progress

Source: https://daisyui.com/components/radial-progress

This example shows how to apply a custom color to the radial progress component using DaisyUI's text color utility classes. The `text-primary` class is used here to set the color.

```html
<div class="radial-progress text-primary" style="--value:70;" aria-valuenow="70" role="progressbar">70%</div>
```

```tsx
import React from 'react';

// ... other components

<div className="radial-progress text-primary" style={{ "--value": 70 } as React.CSSProperties} aria-valuenow={70} role="progressbar">
  70%
</div>
```

--------------------------------

### React Email Input with DaisyUI

Source: https://daisyui.com/components/input

This snippet demonstrates the same email input functionality as the HTML version, but implemented using React and JSX. It leverages DaisyUI classes for styling, mirroring the structure and behavior of the HTML example for a consistent look and feel.

```jsx
<div className="join">
  <div>
    <label className="input validator join-item">
      <svg className="h-[1em] opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <g
          strokeLinejoin="round"
          strokeLinecap="round"
          strokeWidth="2.5"
          fill="none"
          stroke="currentColor"
        >
          <rect width="20" height="16" x="2" y="4" rx="2"></rect>
          <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path>
        </g>
      </svg>
      <input type="email" placeholder="mail@site.com" required />
    </label>
    <div className="validator-hint hidden">Enter valid email address</div>
  </div>
  <button className="btn btn-neutral join-item">Join</button>
</div>
```

--------------------------------

### Centered Card Component

Source: https://daisyui.com/components/card

A card component with centered content, suitable for messages or alerts. This example uses a neutral color theme and includes primary and secondary action buttons. DaisyUI classes handle the layout and styling.

```html
<div class="card bg-neutral text-neutral-content w-96">
  <div class="card-body items-center text-center">
    <h2 class="card-title">Cookies!</h2>
    <p>We are using cookies for no reason.</p>
    <div class="card-actions justify-end">
      <button class="btn btn-primary">Accept</button>
      <button class="btn btn-ghost">Deny</button>
    </div>
  </div>
</div>
```

```jsx
<div className="card bg-neutral text-neutral-content w-96">
  <div className="card-body items-center text-center">
    <h2 className="card-title">Cookies!</h2>
    <p>We are using cookies for no reason.</p>
    <div className="card-actions justify-end">
      <button className="btn btn-primary">Accept</button>
      <button className="btn btn-ghost">Deny</button>
    </div>
  </div>
</div>
```

--------------------------------

### DaisyUI Radio Button with Neutral Color (HTML)

Source: https://daisyui.com/components/radio

Shows how to apply the neutral color variant to DaisyUI radio buttons using the 'radio-neutral' class. This example includes both a checked and an unchecked state for the neutral radio button.

```html
<input type="radio" name="radio-3" class="radio radio-neutral" checked="checked" />
<input type="radio" name="radio-3" class="radio radio-neutral" />
```

--------------------------------

### Stat Component for Data Display

Source: https://daisyui.com/llms

Component for displaying numerical data and statistics in blocks with horizontal or vertical direction. Includes stat-title, stat-value, stat-desc, stat-figure, and stat-actions subcomponents. Defaults to horizontal layout but can be switched to vertical with stats-vertical modifier.

```html
<div class="stats {MODIFIER}">
  <div class="stat">{CONTENT}</div>
</div>
```

--------------------------------

### Card Component for Content Grouping

Source: https://daisyui.com/llms

Cards are used to group and display content. They can include a figure for an image, a card body for text and title, and card actions. Available styles include 'card-border' and 'card-dash'. Modifiers like 'card-side' and 'image-full' change the layout. Sizes can be adjusted from extra-small to extra-large.

```html
<div class="card card-md card-bordered">
  <figure><img src="image-url" alt="alt-text" /></figure>
  <div class="card-body">
    <h2 class="card-title">Card Title</h2>
    <p>This is the card content.</p>
    <div class="card-actions">
      <button class="btn btn-primary">Action</button>
    </div>
  </div>
</div>
```

--------------------------------

### Responsive DaisyUI Menu (Vertical/Horizontal)

Source: https://daisyui.com/components/menu

An example of a responsive DaisyUI menu that displays vertically on small screens and horizontally on larger screens using Tailwind CSS's responsive prefixes. The classes 'menu-vertical' and 'lg:menu-horizontal' control this behavior.

```html
<ul class="menu menu-vertical lg:menu-horizontal bg-base-200 rounded-box">
  <li><a>Item 1</a></li>
  <li><a>Item 2</a></li>
  <li><a>Item 3</a></li>
</ul>
```

--------------------------------

### Customize Selector Size Scale using CSS Variable

Source: https://daisyui.com/docs/v5

The base size scale for selectors such as checkboxes and toggles can be customized using the '--size-selector' CSS variable. This provides flexibility in defining the dimensions of these components.

```css
:root {
  --size-selector: 8px; /* Example: Adjusts base size */
}
```

--------------------------------

### Use Dark Variant with daisyUI Themes in HTML

Source: https://daisyui.com/docs/themes

Apply Tailwind's dark: prefix utilities in HTML elements to create theme-responsive styles. The example shows how padding changes between the 'winter' theme (10 units) and 'night' theme (20 units) using the dark:p-20 utility class.

```html
<div class="p-10 dark:p-20">
  I will have 10 padding on winter theme and 20 padding on night theme
</div>
```

--------------------------------

### DaisyUI Clock Countdown (HTML)

Source: https://daisyui.com/components/countdown

Example of a DaisyUI countdown component formatted as a clock, displaying hours, minutes, and seconds. Each time unit is represented by a separate span with its respective `--value` CSS variable. Text is styled with a monospace font and a size of text-2xl.

```html
<span class="countdown font-mono text-2xl">
  <span style="--value:10;" aria-live="polite" aria-label="10">10</span>
  h
  <span style="--value:24;" aria-live="polite" aria-label="24">24</span>
  m
  <span style="--value:59;" aria-live="polite" aria-label="59">59</span>
  s
</span>
```

--------------------------------

### Dropdown Left Aligned End Vertically (HTML)

Source: https://daisyui.com/components/dropdown

This example displays a dropdown menu aligned to the left and positioned at the end vertically relative to the button. It utilizes DaisyUI's 'dropdown-left' and 'dropdown-end' classes. Basic HTML and DaisyUI are the only requirements.

```html
<div class="dropdown dropdown-left dropdown-end">
  <div tabindex="0" role="button" class="btn m-1">Click ⬅️</div>
  <ul tabindex="-1" class="dropdown-content menu bg-base-100 rounded-box z-1 w-52 p-2 shadow-sm">
    <li><a>Item 1</a></li>
    <li><a>Item 2</a></li>
  </ul>
</div>
```

--------------------------------

### Multiple Indicators with DaisyUI

Source: https://daisyui.com/components/indicator

Demonstrates how to display multiple indicators around a central content box using DaisyUI's indicator classes. This is useful for notifications or status markers. The example uses various classes like `indicator-item`, `indicator-top`, `indicator-middle`, `indicator-bottom`, `indicator-start`, `indicator-center`, and `indicator-end` to position badges.

```html
<div class="indicator">
  <span class="indicator-item indicator-top indicator-start badge">↖︎</span>
  <span class="indicator-item indicator-top indicator-center badge">↑</span>
  <span class="indicator-item indicator-top indicator-end badge">↗︎</span>
  <span class="indicator-item indicator-middle indicator-start badge">←</span>
  <span class="indicator-item indicator-middle indicator-center badge">●</span>
  <span class="indicator-item indicator-middle indicator-end badge">→</span>
  <span class="indicator-item indicator-bottom indicator-start badge">↙︎</span>
  <span class="indicator-item indicator-bottom indicator-center badge">↓</span>
  <span class="indicator-item indicator-bottom indicator-end badge">↘︎</span>
  <div class="bg-base-300 grid h-32 w-60 place-items-center">Box</div>
</div>
```

```jsx
<div className="indicator">
  <span className="indicator-item indicator-top indicator-start badge">↖︎</span>
  <span className="indicator-item indicator-top indicator-center badge">↑</span>
  <span className="indicator-item indicator-top indicator-end badge">↗︎</span>
  <span className="indicator-item indicator-middle indicator-start badge">←</span>
  <span className="indicator-item indicator-middle indicator-center badge">●</span>
  <span className="indicator-item indicator-middle indicator-end badge">→</span>
  <span className="indicator-item indicator-bottom indicator-start badge">↙︎</span>
  <span className="indicator-item indicator-bottom indicator-center badge">↓</span>
  <span className="indicator-item indicator-bottom indicator-end badge">↘︎</span>
  <div className="bg-base-300 grid h-32 w-60 place-items-center">Box</div>
</div>
```

--------------------------------

### HTML Theme Customization with daisyUI Data Attribute

Source: https://daisyui.com/pages/best-component-library-for-beginners

Shows how to apply a theme to an entire HTML document using a data attribute. Changing the 'data-theme' value allows for quick and easy global styling updates across the website.

```html
<html data-theme="light">
  <!-- Your website content goes here -->
</html>
```

--------------------------------

### JSX Carousel Snap to Center with DaisyUI

Source: https://daisyui.com/components/carousel

This JSX snippet demonstrates how to create a carousel that snaps to the center using DaisyUI classes within a React component. It utilizes standard HTML elements with DaisyUI's responsive and layout utilities.

```jsx
<div className="carousel carousel-center rounded-box">
  <div className="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp" alt="Pizza" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      alt="Pizza" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      alt="Pizza" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      alt="Pizza" />
  </div>
  <div className="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp" alt="Pizza" />
  </div>
  <div className="carousel-item">
    <img src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp" alt="Pizza" />
  </div>
  <div className="carousel-item">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      alt="Pizza" />
  </div>
</div>
```

--------------------------------

### HTML Chat Bubbles with DaisyUI

Source: https://daisyui.com/components/chat

This snippet shows a basic implementation of chat bubbles for 'start' and 'end' aligned messages using DaisyUI and HTML. It includes sender images, names, timestamps, message content, and delivery status. No external JavaScript dependencies are required for this HTML structure.

```html
<div class="chat chat-start">
  <div class="chat-image avatar">
    <div class="w-10 rounded-full">
      <img
        alt="Tailwind CSS chat bubble component"
        src="https://img.daisyui.com/images/profile/demo/kenobee@192.webp"
      />
    </div>
  </div>
  <div class="chat-header">
    Obi-Wan Kenobi
    <time class="text-xs opacity-50">12:45</time>
  </div>
  <div class="chat-bubble">You were the Chosen One!</div>
  <div class="chat-footer opacity-50">Delivered</div>
</div>
<div class="chat chat-end">
  <div class="chat-image avatar">
    <div class="w-10 rounded-full">
      <img
        alt="Tailwind CSS chat bubble component"
        src="https://img.daisyui.com/images/profile/demo/anakeen@192.webp"
      />
    </div>
  </div>
  <div class="chat-header">
    Anakin
    <time class="text-xs opacity-50">12:46</time>
  </div>
  <div class="chat-bubble">I hate you!</div>
  <div class="chat-footer opacity-50">Seen at 12:46</div>
</div>
```

--------------------------------

### VS Code MCP Server Configuration

Source: https://daisyui.com/blueprint

This JSON configuration snippet is used to set up the daisyUI Blueprint MCP server within VS Code's user settings. It specifies the command to execute and environment variables required for the server, such as LICENSE and EMAIL.

```json
{
    "servers": {
      "daisyui-blueprint": {
        "type": "stdio",
        "command": "npx",
        "args": ["-y", "daisyui-blueprint@latest"],
        "env": {
          "LICENSE": "",
          "EMAIL": ""
        }
      }
    }
  }
```

--------------------------------

### Customize Button with Tailwind CSS Utility Classes

Source: https://daisyui.com/docs/customize

Use Tailwind CSS utility classes directly on daisyUI components for fine-grained styling control. Examples include rounded-full for fully rounded corners and custom padding utilities.

```html
<button class="btn rounded-full">One</button>
<button class="btn rounded-none px-16">Two</button>
```

--------------------------------

### Fieldset with Multiple Inputs (React)

Source: https://daisyui.com/components/fieldset

Provides a React JSX example for a fieldset containing input fields for 'Title', 'Slug', and 'Author'. It utilizes 'className' for styling, suitable for React applications. Proper 'id' and 'for' attributes are crucial for accessibility.

```jsx
<fieldset className="fieldset bg-base-200 border-base-300 rounded-box w-xs border p-4">
  <legend className="fieldset-legend">Page details</legend>

  <label className="label">Title</label>
  <input type="text" className="input" placeholder="My awesome page" />

  <label className="label">Slug</label>
  <input type="text" className="input" placeholder="my-awesome-page" />

  <label className="label">Author</label>
  <input type="text" className="input" placeholder="Name" />
</fieldset>
```

--------------------------------

### Bootstrap Button Component Customization

Source: https://daisyui.com/pages/best-component-library-for-beginners

Bootstrap button implementation with custom styling overrides. Bootstrap provides pre-built components but requires using !important flags to override default styles, resulting in specificity conflicts and reduced maintainability.

```HTML
<!-- Bootstrap example -->
<button class="btn btn-primary">Click Me</button>

<!-- Want a custom style? Get ready for this: -->
<style>
  .btn-primary {
    --bs-btn-color: #fff;
    --bs-btn-bg: #6200ee !important; /* Have to use !important to override */
    --bs-btn-border-color: #6200ee !important;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #5000c7 !important;
    --bs-btn-hover-border-color: #4b00bd !important;
    --bs-btn-focus-shadow-rgb: 49, 132, 253;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #4b00bd !important;
    --bs-btn-active-border-color: #4700b3 !important;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #6200ee !important;
    --bs-btn-disabled-border-color: #6200ee !important;
  }
</style>
```

--------------------------------

### DaisyUI Timeline Component with React JSX

Source: https://daisyui.com/components/timeline

A React component demonstrating a timeline structure using DaisyUI classes. This example showcases a product history including the Macintosh, iMac, iPod, iPhone, and Apple Watch. It's suitable for displaying product evolution or historical milestones in a web application.

```jsx
<ul className="timeline">
  <li>
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">First Macintosh computer</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iMac</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iPod</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">iPhone</div>
    <hr />
  </li>
  <li>
    <hr />
    <div className="timeline-middle">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 20 20"
        fill="currentColor"
        className="h-5 w-5"
      >
        <path
          fillRule="evenodd"
          d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z"
          clipRule="evenodd"
        />
      </svg>
    </div>
    <div className="timeline-end timeline-box">Apple Watch</div>
  </li>
</ul>
```

--------------------------------

### DaisyUI Empty Badges with Different Sizes (HTML)

Source: https://daisyui.com/components/badge

Provides examples of creating empty badges with various size modifiers in DaisyUI. These can be used as placeholders or for purely functional indicators where only the styling is important. The available sizes include lg, md, sm, and xs.

```html
<div class="badge badge-primary badge-lg"></div>
<div class="badge badge-primary badge-md"></div>
<div class="badge badge-primary badge-sm"></div>
<div class="badge badge-primary badge-xs"></div>
```

```jsx
<div className="badge badge-primary badge-lg"></div>
<div className="badge badge-primary badge-md"></div>
<div className="badge badge-primary badge-sm"></div>
<div className="badge badge-primary badge-xs"></div>
```

--------------------------------

### HTML Carousel with Full Width Items

Source: https://daisyui.com/components/carousel

This snippet shows a basic carousel implementation using DaisyUI and Tailwind CSS classes. Each carousel item takes up the full width of the carousel container, displaying a single image. It relies on the DaisyUI carousel component and basic HTML structure.

```html
<div class="carousel rounded-box w-64">
  <div class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559703248-dcaaec9fab78.webp"
      class="w-full"
      alt="Tailwind CSS Carousel component" />
  </div>
  <div class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1565098772267-60af42b81ef2.webp"
      class="w-full"
      alt="Tailwind CSS Carousel component" />
  </div>
  <div class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1572635148818-ef6fd45eb394.webp"
      class="w-full"
      alt="Tailwind CSS Carousel component" />
  </div>
  <div class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1494253109108-2e30c049369b.webp"
      class="w-full"
      alt="Tailwind CSS Carousel component" />
  </div>
  <div class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1550258987-190a2d41a8ba.webp"
      class="w-full"
      alt="Tailwind CSS Carousel component" />
  </div>
  <div class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1559181567-c3190ca9959b.webp"
      class="w-full"
      alt="Tailwind CSS Carousel component" />
  </div>
  <div class="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1601004890684-d8cbf643f5f2.webp"
      class="w-full"
      alt="Tailwind CSS Carousel component" />
  </div>
</div>
```

--------------------------------

### Button Component with Various Styles, Colors, and Sizes

Source: https://daisyui.com/llms

Buttons allow users to perform actions. They can be styled with outline, dash, soft, ghost, or link variants, and colored using primary, secondary, accent, info, success, warning, or error classes. Sizes range from extra-small to extra-large. Modifiers like 'wide', 'block', 'square', or 'circle' can also be applied. Buttons can be active or disabled.

```html
<button class="btn btn-primary btn-outline btn-lg btn-wide">Click Me</button>
<button class="btn btn-secondary btn-disabled">Disabled</button>
```

--------------------------------

### DaisyUI Select with Fieldset and Labels (React)

Source: https://daisyui.com/components/select

Presents the DaisyUI select component integrated into a fieldset with a legend and an optional label, implemented in React. This example showcases accessible form design patterns using JSX and DaisyUI classes.

```jsx
<fieldset className="fieldset">
  <legend className="fieldset-legend">Browsers</legend>
  <select defaultValue="Pick a browser" className="select">
    <option disabled={true}>Pick a browser</option>
    <option>Chrome</option>
    <option>FireFox</option>
    <option>Safari</option>
  </select>
  <span className="label">Optional</span>
</fieldset>
```

--------------------------------

### DaisyUI Dash Buttons: Various Color Styles

Source: https://daisyui.com/components/button

Demonstrates how to apply the 'dash' style to buttons in DaisyUI, with examples for different color themes like primary, secondary, accent, info, success, warning, and error. These buttons utilize the base 'btn' class along with the 'btn-dash' modifier and a color-specific class.

```html
<button class="btn btn-dash">Default</button>
<button class="btn btn-dash btn-primary">Primary</button>
<button class="btn btn-dash btn-secondary">Secondary</button>
<button class="btn btn-dash btn-accent">Accent</button>
<button class="btn btn-dash btn-info">Info</button>
<button class="btn btn-dash btn-success">Success</button>
<button class="btn btn-dash btn-warning">Warning</button>
<button class="btn btn-dash btn-error">Error</button>
```

```jsx
<button className="btn btn-dash">Default</button>
<button className="btn btn-dash btn-primary">Primary</button>
<button className="btn btn-dash btn-secondary">Secondary</button>
<button className="btn btn-dash btn-accent">Accent</button>
<button className="btn btn-dash btn-info">Info</button>
<button className="btn btn-dash btn-success">Success</button>
<button className="btn btn-dash btn-warning">Warning</button>
<button className="btn btn-dash btn-error">Error</button>
```

--------------------------------

### Custom CSS Button Styling from Scratch

Source: https://daisyui.com/pages/best-component-library-for-beginners

Complete CSS implementation of a styled button component with hover, active, focus, and disabled states. This approach requires writing extensive CSS for each component variant, leading to code duplication and inconsistency across pages.

```CSS
/* Writing CSS from scratch example */
.my-button {
  background-color: #4338ca;
  color: white;
  padding: 10px 16px;
  border-radius: 6px;
  font-weight: 600;
  font-size: 14px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  cursor: pointer;
  transition: all 0.2s ease;
  border: none;
  outline: none;
  position: relative;
  overflow: hidden;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
}
.my-button:hover {
  background-color: #3730a3;
  transform: translateY(-1px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.my-button:active {
  background-color: #312e81;
  transform: translateY(0);
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
}
.my-button:focus {
  outline: 2px solid #818cf8;
  outline-offset: 2px;
}
.my-button:disabled {
  background-color: #c7d2fe;
  color: #6366f1;
  cursor: not-allowed;
  box-shadow: none;
}
```

--------------------------------

### DaisyUI Countdown Component Syntax

Source: https://daisyui.com/llms

The DaisyUI countdown component provides a transition effect for numbers between 0 and 999. It uses a `span` with the `countdown` class and a nested `span` to set the number via the `--value` CSS variable. JavaScript is required to update the number and the span's text.

```html
<span class="countdown">
  <span style="--value:{number};">number</span>
</span>
```

--------------------------------

### Build Carousel with Indicator Buttons in React

Source: https://daisyui.com/components/carousel

React/JSX implementation of a carousel component with indicator buttons using DaisyUI classes. Uses className attributes and anchor links for seamless navigation between carousel items with native browser scrolling behavior.

```JSX
<div className="carousel w-full">
  <div id="item1" className="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1625726411847-8cbb60cc71e6.webp"
      className="w-full" />
  </div>
  <div id="item2" className="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1609621838510-5ad474b7d25d.webp"
      className="w-full" />
  </div>
  <div id="item3" className="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1414694762283-acccc27bca85.webp"
      className="w-full" />
  </div>
  <div id="item4" className="carousel-item w-full">
    <img
      src="https://img.daisyui.com/images/stock/photo-1665553365602-b2fb8e5d1707.webp"
      className="w-full" />
  </div>
</div>
<div className="flex w-full justify-center gap-2 py-2">
  <a href="#item1" className="btn btn-xs">1</a>
  <a href="#item2" className="btn btn-xs">2</a>
  <a href="#item3" className="btn btn-xs">3</a>
  <a href="#item4" className="btn btn-xs">4</a>
</div>
```
