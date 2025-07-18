# Lliçons

## Description

Lliçons is a simple and elegant learning management system (LMS) designed to help educators create, manage, and deliver online courses. It provides a user-friendly interface for both instructors and students, making it easy to navigate through course materials, assignments, and assessments.

Lliçons is available at [https://lliçons.jutge.org](https://lliçons.jutge.org).

## Installation

To install Lliçons, follow these steps:

1. Install Bun.

   See https://bun.com/

1. Fork the https://github.com/jordi-petit/llicons-noves repository on GitHub.

1. Clone your forked repository:

   ```bash
   git clone git@github.com:<your-username>/llicons-noves.git
   ```

## Development

There are different courses available: `index`, `python`, `cpp`, `terminal` and `circuits`. Each of them is a [https://vitepress.dev/](VitePress) project. There is also a `template` directory that contains a template to create a new course.

To start the development server on one of the courses (say `python`), go to its main directory:

```bash
cd python
```

Install the dependencies with this command:

```bash
bun install
```

To run the development server, execute:

```bash
bun run dev
```

Open your browser and navigate to `http://localhost:5173/`, where `PORT` is the port number assigned to the VitePress server (this is displayed). In this window, you can view the course content with live updates.

The actual contents for the courses are in the `src` directory of each course. Each page is a Markdown file. You can edit and add files directly, and the changes will be reflected in real-time in your browser.

There is also a hidden `.vitepress` directory in each course, which contains the configuration files for VitePress. You can customize the appearance and behavior of the courses by modifying these files. In particular, the `.vitepress/index.js` file allows you to set the table of contents for the course. The `.vitepress/theme/Autors.vue` file is used to display the authors of the course at the bottom of each page.

## Deployment

In order to build the courses for production, execute

```bash
bun run build
```

This will generate the static files in the `dist` directory. Check that no errors are reported during the build process.

You cannot deploy the courses directly to the server. Instead, commit your changes to the `main` branch of your forked repository and then create a pull request to the original repository. The maintainers will review your changes and deploy them to the live site.

## Credits

Lliçons is developed and maintained by [Jordi Petit](https://github.com/jordi-petit) within the [Jutge.org](https://jutge.org) team of the [Computer Science](https://www.cs.upc.edu) department at the [Universitat Politècnica de Catalunya](https://www.upc.edu). The course pages are authored by various contributors, including students and educators, see their credits at the bottom of each page.

## License

TBD
