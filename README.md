# CSS frameworks, Symfony & Twig

## Presentation

Which is the best CSS framework to use with Symfony and Twig?

## Prerequisites

Be sure to install the latest version of:

- [Symfony CLI](https://symfony.com/download);
- [NVM](https://github.com/nvm-sh/nvm) or [Node](https://nodejs.org/);

## Installation

TODO

## Structure

```shell
$ tree -L 2 -v --dirsfirst -A
.
├── apps
│   ├── bootstrap
│   │   ├── easy
│   │   └── expert
│   ├── foundation
│   │   ├── easy
│   │   └── expert
│   ├── pico
│   │   ├── easy
│   │   └── expert
│   └── tailwind
│       ├── easy
│       └── expert
└── README.md
```

## Levels of use

We will simulate two levels of use of the CSS framework:

- Level 1 - easy:
    - No imposed graphic identity.
    - Exclusive use of the framework's default functions, components and theme, without overhead.
- Level 2 - expert:
    - The customer's graphic identity is imposed, with precise mock-up to integrate.
    - Creating a theme, customizing and/or extending the framework is essential to apply colors and get closer to the style of the customer's graphic charter, with use of global options, use of the extended color system, etc.

## Use cases

## Project basic install

1 - Create an empty new project, with [MakerBundle](https://symfony.com/bundles/SymfonyMakerBundle/current/index.html):

```shell
symfony new apps/pico/easy --no-git
composer require symfony/maker-bundle --dev
```

2 - Or use [Webpack Encore](https://symfony.com/doc/current/frontend/encore/index.html):

```shell
composer require symfony/webpack-encore-bundle
npm install
```

2' - Use [AssetMapper](https://symfony.com/doc/current/frontend/asset_mapper.html):

```shell
composer require symfony/asset-mapper symfony/asset symfony/twig-pack
```

## CSS framework quick start (minimal steps)

### Pico

Install:

```shell
symfony console importmap:require @picocss/pico@2
````

Import:

- https://github.com/picocss/examples/blob/master/v2-html/js/minimal-theme-switcher.js
- https://github.com/picocss/examples/blob/master/v2-html/js/modal.js

### Foundation

Install:

```shell
npm install foundation-sites
npm install jquery --save-dev
```

HTML examples used:

- https://get.foundation/templates-previews-sites-f6-xy-grid/news-magazine.html.

### Tailwind

Install:

```shell
cd symfony-css-frameworks
. scripts/new-encore.sh "apps/tailwind/easy" "TAILWIND 🌊"
```

```shell
cd apps/tailwind/easy
npm install -D tailwindcss postcss postcss-loader autoprefixer
npx tailwindcss init -p
```

HTML examples used:

- https://tailwindui.com/components/application-ui/application-shells/stacked
- https://tailwindui.com/components/marketing/sections/feature-sections
- https://tailwindui.com/components/marketing/elements/flyout-menus

## Troubleshooting

### Error: ENOSPC: System limit for number of file watchers reached

On `npm run watch`, we can have the following error:

```
Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/home/.../foundation/easy'
```

Apply the solution on https://stackoverflow.com/a/55763478/13480534.

## History

- 2011: Boostrap
- 2014: Foundation
- 2014: Milligram
- 2017: Tailwind CSS
- 2019: Pico

## Resources

- Symfony:
    - https://symfony.com/doc/current/setup.html#the-symfony-demo-application
    - https://symfony.com/doc/current/configuration/multiple_kernels.html
- Assets:
- CSS Frameworks:
    - Bootstrap:
        - https://getbootstrap.com/
    - Foundation:
        - https://get.foundation/
    - Milligram:
        - https://milligram.io/
    - Pico:
        - https://picocss.com/
    - Tailwind:
        - https://tailwindcss.com/
        - https://tw-elements.com/
        - https://www.material-tailwind.com/
        - https://www.yourigalescot.com/fr/blog/comment-integrer-tailwindcss-v3-a-un-projet-symfony-avec-webpack-encore
        - https://flowbite.com/
        - https://alpinejs.dev/
- Examples for use cases:
    - https://colorlib.com/wp/themes/
    - https://preview.colorlib.com/theme/bootstrap/contact-form-04/
    - https://colorlib.com/wp/wp-content/uploads/sites/2/contact-form-04.jpg

## Comments, suggestions?

Feel free to make comments/suggestions to me in the [Git issues section](https://github.com/jprivet-dev/css-framework-symfony/issues).

## License

This project is released under the [**MIT License**](https://github.com/jprivet-dev/css-framework-symfony/blob/main/LICENSE).
