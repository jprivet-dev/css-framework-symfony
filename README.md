# CSS frameworks, Symfony & Twig

## Presentation

Which is the best CSS framework to use with Symfony and Twig?

## Prerequisites

Be sure to install the latest version of:

- [Symfony CLI](https://symfony.com/download);
- [NVM](https://github.com/nvm-sh/nvm);

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

```shell
symfony new apps/pico/easy --no-git
composer require symfony/asset-mapper symfony/asset symfony/twig-pack
composer require symfony/maker-bundle --dev
```

## CSS framework quick start

### Pico

```shell
symfony console importmap:require @picocss/pico@2
````

## Resources

- Symfony:
    - https://symfony.com/doc/current/setup.html#the-symfony-demo-application
    - https://symfony.com/doc/current/configuration/multiple_kernels.html
- Assets:
- 
- CSS Frameworks:
    - Bootstrap:
        - https://getbootstrap.com/
    - Foundation:
        - https://get.foundation/
    - Pico:
        - https://picocss.com/
    - Tailwind:
        - https://tailwindcss.com/
- Examples for use cases:
    - https://colorlib.com/wp/themes/
    - https://preview.colorlib.com/theme/bootstrap/contact-form-04/
    - https://colorlib.com/wp/wp-content/uploads/sites/2/contact-form-04.jpg

## Comments, suggestions?

Feel free to make comments/suggestions to me in the [Git issues section](https://github.com/jprivet-dev/css-framework-symfony/issues).

## License

This project is released under the [**MIT License**](https://github.com/jprivet-dev/css-framework-symfony/blob/main/LICENSE).
