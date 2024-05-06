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

### Basic use case 2: login form

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

## Bootstrap

### Basic use case 1: simple example (minimal steps of install)

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
- https://github.com/twbs/bootstrap/tree/main/site/content/docs/5.3/examples
- https://symfony.com/doc/current/frontend/encore/bootstrap.html

## Foundation

### Basic use case 1: simple example (minimal steps of install)

Install:

```shell
npm install foundation-sites
npm install jquery --save-dev
```

HTML examples used:

- https://get.foundation/templates-previews-sites-f6-xy-grid/news-magazine.html.

### Resouces

- https://get.foundation/

## Pico

### Basic use case 1: simple example (minimal steps of install)

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

### Basic use case 2: login form


TODO

### Resources

- https://picocss.com/

## Tailwind

### Basic use case 1: simple example (minimal steps of install)

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

HTML examples used:

- https://tailwindui.com/components/application-ui/application-shells/stacked
- https://tailwindui.com/components/marketing/sections/feature-sections
- https://tailwindui.com/components/marketing/elements/flyout-menus

### Resources

- https://tailwindcss.com/
- https://tw-elements.com/
- https://www.material-tailwind.com/
- https://www.yourigalescot.com/fr/blog/comment-integrer-tailwindcss-v3-a-un-projet-symfony-avec-webpack-encore
- https://flowbite.com/
- https://alpinejs.dev/

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
