const eachimg = document.querySelector('.eachimg')
const imageboxs = document.querySelectorAll('.image-box')

imageboxs.forEach((eachbox) => {
  eachbox.addEventListener('mouseover', () => {
    // console.log(eachbox.innerHTML)
    eachimg.src = `./images/${eachbox.innerHTML}.jpg`
  })
})
