#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  lang: "en",
  region: "US",
  font: "libertinus serif",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "libertinus serif",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set par(justify: true)
  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize
  )
  set heading(numbering: sectionnumbering)

  let accent = rgb("#B88228")
  let deep = rgb("#1F1A13")
  let muted = rgb("#6F5C36")
  let panel = rgb("#F4EBDD")
  let line = rgb("#D6C7AF")

  set page(numbering: none)

  align(center + horizon)[
    #block(inset: (top: 2.2cm, bottom: 1.2cm))[
      #rect(width: 100%, height: 2.5pt, fill: accent)
      #v(1.3cm)
      #text(size: 0.95em, tracking: 0.12em, fill: muted)[GUIA PRACTICA]
      #v(0.7cm)
      #text(
        size: 2.25em,
        weight: "bold",
        font: heading-family,
        fill: deep
      )[#title]
      #if subtitle != none {
        v(0.45cm)
        text(size: 1.08em, fill: muted)[#subtitle]
      }
      #v(1.2cm)
      #block(
        width: 100%,
        fill: panel,
        stroke: (paint: line, thickness: 0.8pt),
        radius: 8pt,
        inset: 16pt
      )[
        #set align(left)
        #text(weight: "semibold", fill: accent)[Objetivo]
        #parbreak()
        Entender una secuencia reproducible para pasar de datos tabulares a
        visualizaciones claras, elegantes y defendibles con #text(weight: "semibold")[ggplot2].
      ]
      #v(2.2cm)
      #if authors != none {
        for author in authors {
          text(size: 1.03em, weight: "semibold", fill: deep)[#author.name]
          if author.affiliation != [] {
            parbreak()
            text(fill: muted)[#author.affiliation]
          }
          v(0.2cm)
        }
      }
      #if date != none {
        v(0.45cm)
        text(fill: muted)[#date]
      }
      #v(1.4cm)
      #rect(width: 38%, height: 1.5pt, fill: accent)
    ]
  ]

  pagebreak()

  if toc {
    align(center)[
      #text(
        size: 1.55em,
        weight: "bold",
        font: heading-family,
        fill: deep
      )[
        #(if toc_title == none { [Tabla de contenidos] } else { toc_title })
      ]
    ]
    v(0.8cm)
    outline(
      title: none,
      depth: toc_depth,
      indent: toc_indent
    )
    pagebreak()
  }

  set page(numbering: "1 / 1")
  counter(page).update(1)

  if abstract != none {
    block(inset: 2em)[
      #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
