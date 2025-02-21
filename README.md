# Quizst

**Quizst** is a Typst template designed for creating Multiple Choice Question (MCQ) exams. This template provides a structured and easy-to-use format for educators to generate professional-looking exam papers.

## Usage

You can use this template in the Typst web app by clicking “Start from template” on the dashboard and searching for Quizst.

Alternatively, you can use the CLI to kick this project off using the command:

```sh
typst init @preview/Quizst
```

Typst will create a new directory with all the files needed to get you started.

## Configuration

This template exports the `quiz` function with the following named arguments:

- `title`: The exam’s title as content.
- `authors`: An array of author dictionaries. Each author dictionary must have a `name` key and can have the keys `prefix` and `link`. All keys accept content.
- `json_data`: An array of question dictionaries. Each question dictionary must have a `question` key and can have the keys `options` and `answer`. All keys accept content.
- `paper-size`: Defaults to `a4`. Specify a paper size string to change the page format.
- `highlight-answer`: Defaults to `false`. Set to `true` to highlight the correct answers.

The function also accepts a single, positional argument for the body of the exam.

The template will initialize your package with a sample call to the `quiz` function in a show rule. If you want to change an existing project to use this template, you can add a show rule like this at the top of your file:

```typst
#import "@preview/Quizst:0.1.0": quiz

#show: quiz.with(
  title: [Sample MCQ Exam],
  authors: (
    (
      name: "John Doe",
      prefix: "Dr.",
      link: "mailto:johndoe@example.com"
    ),
    (
      name: "Jane Smith",
      prefix: "Prof.",
      link: "mailto:janesmith@example.com"
    ),
  ),
  json_data: (
    (
      question: "What is the capital of France?",
      options: ("Paris", "London", "Berlin", "Madrid"),
      answer: "Paris"
    ),
    (
      question: "What is 2 + 2?",
      options: ("3", "4", "5", "6"),
      answer: "4"
    ),
  ),
  highlight-answer: true
)

// Your content goes below.
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## Acknowledgements

Special thanks to the Typst community for their support and contributions.