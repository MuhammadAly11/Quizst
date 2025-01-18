#import "lib.typ": quiz

#let json_data = json("example.json")

#show: quiz.with(
  title: "First Quiz",
  authors: (
    (
      name: "Martin Haug",
      prefix: "Created by:",
      link: "https://hi.com",
    ),
    (
      name: "Bot",
      prefix: "Generated by:",
      link: "https://hi.com",
    ),
  ),
  json_data: json_data,
)

