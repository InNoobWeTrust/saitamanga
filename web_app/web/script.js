"use strict"

// Config file will (likely) be a json
const hvtt = {
  apiVersion: 1,
  ECMAScriptVersion: "ECMAScript 5", // reference: https://www.w3schools.com/Js/js_versions.asp
  origin: "http://hocvientruyentranh.com",
  cloudflare: true,
  segments: {
    All: {
      type: "plain",
      path: "/manga/all",
      params: {
        page: {
          type: "int",
          default: 1,
        },
      },
      linkParser:
        "function(e){var nodes=e.querySelectorAll('table.table-hover>tbody>tr>td:nth-child(1)>a');var links=[];for(var i=0;i<nodes.length;i++) links.push(nodes[i].getAttribute('href'));return links;}",
      titleParser:
        "function(e){var nodes=e.querySelectorAll('table.table-hover>tbody>tr>td:nth-child(1)>a');var titles=[];for(var i=0;i<nodes.length;i++) titles.push(nodes[i].getAttribute('title'));return titles;}",
      imageParser:
        "function(e){var nodes=e.querySelectorAll('table.table-hover>tbody>tr>td:nth-child(1)>a');var images=[];for(var i=0;i<nodes.length;i++) images.push(nodes[i].getAttribute('data-thumbnail'));return images;}",
      paginationLabelParser:
        "function(e){var nodes=e.querySelectorAll('.pagination.no-margin>li>a');var labels=[];for(var i=0;i<nodes.length;i++) labels.push(nodes[i].innerText);return labels;}",
      paginationLinkParser:
        "function(e){var nodes=e.querySelectorAll('.pagination.no-margin>li>a');var links=[];for(var i=0;i<nodes.length;i++) links.push(nodes[i].getAttribute('href'));return links;}",
      prevPageParser:
        "function(e){var node=e.querySelector('.pagination.no-margin>li>a[rel=prev]');return !!node?node.getAttribute('href'):undefined;}",
      nextPageParser:
        "function(e){var node=e.querySelector('.pagination.no-margin>li>a[rel=next]');return !!node?node.getAttribute('href'):undefined;}",
    },
  },
}

// All the code below this line is just to show a quick demo rendered by browser
const origin = hvtt.origin
const segment = hvtt.segments["All"]
const uri = `${origin}${segment.path}`
const titleParser = eval(`(${segment.titleParser})`)
const linkParser = eval(`(${segment.linkParser})`)
const imageParser = eval(`(${segment.imageParser})`)
const paginationLabelParser = eval(`(${segment.paginationLabelParser})`)
const paginationLinkParser = eval(`(${segment.paginationLinkParser})`)
const prevPageParser = eval(`(${segment.prevPageParser})`)
const nextPageParser = eval(`(${segment.nextPageParser})`)

const parse = e => {
  const titles = titleParser(e)
  const links = linkParser(e)
  const images = imageParser(e)
  // console.log(titles.length, images.length);
  if (titles.length !== links.length || titles.length !== images.length)
    return []
  const mangaData = []
  for (let i = 0; i < titles.length; i++) {
    mangaData.push({
      title: titles[i],
      link: links[i],
      image: images[i],
    })
  }
  const paginationLabels = paginationLabelParser(e)
  const paginationLinks = paginationLinkParser(e)
  const paginationData = []
  for (let i = 0; i < paginationLabels.length; i++) {
    paginationData.push({
      label: paginationLabels[i],
      link: paginationLinks[i],
    })
  }
  const prevPage = prevPageParser(e)
  const nextPage = nextPageParser(e)
  return {
    manga: mangaData,
    pagination: paginationData,
    prev: prevPage,
    next: nextPage,
  }
}

const getLinkAsync = (method, uri) => {
  const request = new XMLHttpRequest()
  request.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200 && this.status < 400) {
      const data = JSON.parse(request.responseText)
      const e = document.createElement("div")
      e.innerHTML = data.contents
      const parsed = parse(e)
      const cards = parsed["manga"]
        .map(data => {
          return card(data)
        })
        .join("")
      const footer = footerWidget(parsed["pagination"])
      const footerPrevNext = footerPrevNextWidget(
        parsed["prev"],
        parsed["next"]
      )
      document.querySelector(".container").innerHTML =
        cards + footer + footerPrevNext
    }
  }
  request.open(method, uri, true)
  request.send(null)
}

const card = data => {
  return `<div class="manga_card">${imageWidget(data.image)}${titleWidget(
    data.title,
    data.link
  )}</div>`
}
const imageWidget = imgsrc => {
  return `<img src="${imgsrc}">`
}
const titleWidget = (title, link) => {
  return `<a href="${link}">${title}</a>`
}
const paginationWidget = pagination => {
  return `<a href="${pagination.link}">${pagination.label}</a>`
}
const footerWidget = paginations => {
  return `<footer>${paginations
    .map(p => paginationWidget(p))
    .join("")}</footer>`
}
const footerPrevNextWidget = (prev, next) => {
  return `<footer><a href=${!!prev ? prev : "#"}>«</a><a href=${
    !!next ? next : "#"
  }>»</a></footer>`
}
const render = () => {
  getLinkAsync(
    "GET",
    `https://allorigins.me/get?url=${encodeURIComponent(uri)}`
  )
}