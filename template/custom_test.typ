#import "../lib.typ": quiz

#let json_data = json("input/custom_mode.json")

#show: quiz.with(
  highlight-answer: true,
  json-data: json_data,
) 