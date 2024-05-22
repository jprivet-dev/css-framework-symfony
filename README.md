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
│   │   ├── basic
│   │   └── expert
│   ├── foundation
│   │   ├── basic
│   │   └── expert
│   ├── pico
│   │   ├── basic
│   │   └── expert
│   └── tailwind
│       ├── basic
│       └── expert
└── README.md
```

## Levels of use

We will simulate two levels of use of the CSS framework:

- Level 1 - basic:
    - No imposed graphic identity.
    - Exclusive use of the framework's default functions, components and theme, without overhead.
- Level 2 - expert:
    - The customer's graphic identity is imposed, with precise mock-up to integrate.
    - Creating a theme, customizing and/or extending the framework is essential to apply colors and get closer to the style of the customer's graphic charter, with use of global options, use of the extended color system, etc.

## Use cases

### Basic use case 1: simple example

Minimal steps of install and display of a simple example.

1 - Create an empty new project, with [MakerBundle](https://symfony.com/bundles/SymfonyMakerBundle/current/index.html):

```shell
symfony new apps/pico/basic --no-git
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

### Basic use case 2: login page

The idea is to use the default connection form layouts of the CSS frameworks, and to check that the coupling with what Symfony generates by default (https://symfony.com/doc/current/security.html) is as easy as possible.

```shell
composer require symfony/security-bundle
symfony console make:user
symfony console make:auth
```

```shell
$ symfony console make:auth

 What style of authentication do you want? [Empty authenticator]:
  [0] Empty authenticator
  [1] Login form authenticator
 > Login form authenticator

 The class name of the authenticator to create (e.g. AppCustomAuthenticator):
 > InMemoryUserAuthenticator

 Choose a name for the controller class (e.g. SecurityController) [SecurityController]:
 > 

 Enter the User class that you want to authenticate (e.g. App\Entity\User) []:
 > Symfony\Component\Security\Core\User\InMemoryUser

 Do you want to generate a '/logout' URL? (yes/no) [yes]:
 > 

 Do you want to support remember me? (yes/no) [yes]:
 > 

 How should remember me be activated? [Activate when the user checks a box]:
  [0] Activate when the user checks a box
  [1] Always activate remember me
 > 
```

Symfony Password Hash Utility:

```shell
symfony console security:hash-password myPassword
```

Comparisons:

```shell
wc apps/tailwind/basic/templates/security/login.html.twig
wc apps/bootstrap/basic/templates/security/login.html.twig
wc apps/foundation/basic/templates/security/login.html.twig
wc apps/pico/basic/templates/security/login.html.twig
wc apps/raw/basic/templates/security/login.html.twig
wc apps/bulma/basic/templates/security/login.html.twig
```

| Name                        | Chars (count) | Diff (chars)  | Diff (%)  |
|-----------------------------|---------------|---------------|-----------|
| tailwind::login.html.twig   | 3423          | +2120         | +162.7%   |
| bulma::login.html.twig      | 2579          | +1276         | +97.9%    |
| bootstrap::login.html.twig  | 2172          | +869          | +66.7%    |
| foundation::login.html.twig | 1720          | +417          | +32.0%    |
| pico::login.html.twig       | 1442          | +139          | +10.7%    |
| raw::login.html.twig        | 1303          | 0             | 0         |

## Bootstrap

### Minimal steps of install

Install:

```shell
cd symfony-css-frameworks
. scripts/new-encore.sh "apps/bootstrap/basic" "BOOTSTRAP 🅱️"
```

```shell
cd apps/bootstrap/basic
npm install bootstrap
npm install sass-loader sass --save-dev
```

HTML examples used:

- https://getbootstrap.com/docs/5.3/examples/album/

### Resources

- https://getbootstrap.com/
- Examples / Components:
  - https://github.com/twbs/bootstrap/tree/main/site/content/docs/5.3/examples
  - https://getbootstrap.com/docs/5.3/examples/
- Preview:
  - https://getbootstrap.com/docs/5.3/examples/album/
- Login:
  - https://getbootstrap.com/docs/5.3/examples/sign-in/
- Symfony:
  - https://symfony.com/doc/current/frontend/encore/bootstrap.html
- Templates/Themes:
  - https://startbootstrap.com/
  - https://github.com/StartBootstrap
  - https://themes.getbootstrap.com/
  - https://themes.getbootstrap.com/guide/#customizing-your-theme
  - https://themes.getbootstrap.com/guide/#integrating-with-frameworks

## Bulma

### Minimal steps of install

Install:

```shell
cd symfony-css-frameworks
. scripts/new-encore.sh "apps/bulma/basic" "BULMA ⚛️"
```

```shell
cd apps/bootstrap/basic
npm install bulma
npm install sass-loader sass --save-dev
```

HTML examples used:

- https://getbootstrap.com/docs/5.3/examples/album/

### Resources

- https://bulma.io/
- https://medium.com/weekly-webtips/bulma-and-symfonys-webpack-encore-f79f48c328aa

## Foundation

### Minimal steps of install

Install:

```shell
npm install foundation-sites
npm install jquery --save-dev
```

### Resouces

- https://get.foundation/
- Examples / Components:
  - https://get.foundation/building-blocks/
  - https://get.foundation/sites/docs/prototyping-utilities.html
- Preview:
  - https://get.foundation/templates-previews-sites-f6-xy-grid/news-magazine.html.
- Login form:
  - https://get.foundation/building-blocks/blocks/form-login.html
- Templates/Themes:
  - https://get.foundation/templates.html
  - https://mobirise.com/website-templates/foundation-website-templates/:
    - https://mobirise.com/extensions/edgem5/it-expertise/
    - https://mobirise.com/extensions/solutionm4/marketingsolution/

> **From Foundation v6.4, the Float Grid is disabled by default**, replaced by the new [XY Grid](https://get.foundation/sites/docs/xy-grid.html). Unless you need to support IE 10, it is recommended to use the XY Grid.

## Pico

### Minimal steps of install

Install:

```shell
symfony console importmap:require @picocss/pico@2
````

Import:

- https://github.com/picocss/examples/blob/master/v2-html/js/minimal-theme-switcher.js
- https://github.com/picocss/examples/blob/master/v2-html/js/modal.js

Next time, just run the following commands:

```shell
cd apps/pico/basic
make start # And go on the Local Web Server (on https://127.0.0.1:8000/ for example)
```

TODO

### Resources

- https://picocss.com/
- Examples / Components:
  - https://picocss.com/examples
- Preview:
  - https://4mrnhq.csb.app/
- Login form:
  - https://picocss.com/docs/forms

## Tailwind

### Minimal steps of install

Install:

```shell
cd symfony-css-frameworks
. scripts/new-encore.sh "apps/tailwind/basic" "TAILWIND 🌊"
```

```shell
cd apps/tailwind/basic
npm install -D tailwindcss postcss postcss-loader autoprefixer
npx tailwindcss init -p
```

### Resources

- https://tailwindcss.com/
- Examples / Components:
  - https://tailwindui.com/components/#product-application-ui
- Preview:
  - https://tailwindui.com/components/application-ui/application-shells/stacked
  - https://tailwindui.com/components/marketing/sections/feature-sections
  - https://tailwindui.com/components/marketing/elements/flyout-menus
- Variants:
  - https://tw-elements.com/
  - https://www.material-tailwind.com/
  - https://flowbite.com/
- Login:
  - https://tailwindui.com/components/application-ui/forms/sign-in-forms
  - https://tailwindui.com/components/application-ui/forms/form-layouts
  - https://tailwindui.com/components/application-ui/forms/toggles 🔒
- JS:
  - https://alpinejs.dev/
- Symfony:
  - https://www.yourigalescot.com/fr/blog/comment-integrer-tailwindcss-v3-a-un-projet-symfony-avec-webpack-encore
- Templates/Themes:
  - https://www.tailwindawesome.com/?order=popular&price=all&type=template
  - Flowbite Admin Dashboard:
    - https://www.tailwindawesome.com/resources/flowbite-admin-dashboard
    - https://github.com/themesberg/flowbite-admin-dashboard
  - Vue Dashboard Template:
    - https://www.tailwindawesome.com/resources/vue-dashboard-template
    - https://github.com/wobsoriano/v-dashboard
  - Ada:
    - https://www.tailwindawesome.com/resources/ada
    - https://github.com/Tailus-UI/ada-html

## Troubleshooting

### Error: ENOSPC: System limit for number of file watchers reached

On `npm run watch`, we can have the following error:

```
Watchpack Error (watcher): Error: ENOSPC: System limit for number of file watchers reached, watch '/home/.../foundation/basic'
```

Apply the solution on https://stackoverflow.com/a/55763478/13480534.

## History

- 2011: Boostrap
- 2014: Foundation
- 2014: Milligram
- 2017: Tailwind CSS
- 2019: Pico

## General resources

- https://github.com/troxler/awesome-css-frameworks
- https://colorlib.com/wp/free-css3-frameworks/
- https://prismic.io/blog/best-css-frameworks
- Symfony:
    - https://symfony.com/doc/current/setup.html#the-symfony-demo-application
    - https://symfony.com/doc/current/configuration/multiple_kernels.html
    - Security:
      - https://symfony.com/doc/current/security.html#form-login
      - https://github.com/symfony/symfony/blob/7.1/src/Symfony/Component/Security/Core/User/InMemoryUser.php
- Other CSS Frameworks:
    - https://milligram.io/
- Examples for use cases:
    - https://colorlib.com/wp/themes/
    - https://preview.colorlib.com/theme/bootstrap/contact-form-04/
    - https://colorlib.com/wp/wp-content/uploads/sites/2/contact-form-04.jpg

## Comments, suggestions?

Feel free to make comments/suggestions to me in the [Git issues section](https://github.com/jprivet-dev/css-framework-symfony/issues).

## License

This project is released under the [**MIT License**](https://github.com/jprivet-dev/css-framework-symfony/blob/main/LICENSE).
