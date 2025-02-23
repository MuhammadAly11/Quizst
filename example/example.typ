#let json_data = json("../example.json")
#let isHiglighted = true

#set document(
  title: json_data.module + " - " + json_data.subject
)

#set page(
  numbering: "1/1",
  margin: (x: 21.5pt, top: 30.51pt, bottom: 30.51pt),
)

#align(center)[
  #text(24pt, smallcaps(json_data.module))
  #linebreak()
  #text(18pt, json_data.subject + " - " + json_data.lesson)
]

#set text(20pt, weight: 500)

#for mcq in json_data.questions [
  + #mcq.question:
    #set enum(numbering: "a)")
    #set text(17pt, weight: 500)
    #for opt in ("a", "b", "c", "d", "e", "f", "g") [
      #if isHiglighted and opt == mcq.answer [
        #highlight[
          + #mcq.at(opt)
        ]
      ] else if opt in mcq and mcq.at(opt) != "" [
        + #mcq.at(opt)
      ]
    ]
]

#v(2em)
#align(center, text(24pt, smallcaps("Answers")))

#grid(
  align: center,
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 1em,
  ..json_data.questions.map(mcq => [#mcq.sn. #mcq.answer])
)