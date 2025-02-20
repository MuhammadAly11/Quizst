#import "../lib.typ": quiz

#let json_data = json("../example.json")

#show: quiz.with(
  title: "First Quiz",
  highlight-answer: true,
  json_data: json_data,
)

