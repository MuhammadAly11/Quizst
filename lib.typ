// This function gets your whole document as its `body` and formats
#let quiz(
  title: "Title",
  authors: (),
  json_data: (),
  paper-size: "a4",
  highlight-answer: "No",
  body
) = {
  set document(title: title, author: authors.map(author => author.name))

  set page(
    paper: paper-size,
    numbering: "1/1",
    margin: (x: 21.5pt, top: 30.51pt, bottom: 30.51pt)
  )


  show link: it => [
    #set text(12pt, weight: 500, style: "italic", blue)
    #emph(underline(it))
  ]

  // title
  v(3pt, weak: true)
  align(center, text(24pt, smallcaps(title)))
  v(5.35mm, weak: true)

  // Display the authors list.
  for i in range(calc.ceil(authors.len() / 3)) {
    let end = calc.min((i + 1) * 3, authors.len())
    let is-last = authors.len() == end
    let slice = authors.slice(i * 3, end)
    grid(
      columns: slice.len() * (1fr,),
      gutter: 14pt,
      ..slice.map(author => align(center, {
        text(12pt, author.prefix)
        if "name" in author [
          \ #emph(link(author.link)[#author.name])
        ]
      }))
    )
  }

  set text(16pt, weight: 500)

  for mcq in json_data { 
    [== #mcq.sn. #mcq.question: ] 
      for opt in ("a", "b", "c", "d", "e", "f", "g") { 
        if opt in mcq and mcq.at(opt) != "" { 
          [=== #opt) #mcq.at(opt)] 
        } 
      } 
  } 


  v(20pt, weak: true)
  align(center, text(24pt, smallcaps("The Answer")))
  v(8.35mm, weak: true)

  set par (spacing: 0.65em)
  set par(
    justify: true,
  )

  // todo: display a table of correct answers
  // grid(
  //   columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  //   align: center,
  //   gutter: 1em,
  //   for mcq in json_data { 
  //     ..mcq.enumerate(start: 1).map(((idx, mcq)) => [ #mcq.sn #mcq.answer ])
  //   }
  //   )

  // Display the paper's contents.
  body
}