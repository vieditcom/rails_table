const fadeOut = (el, duration = 2000) => {
  el.style.opacity = '1'
  el.style.transition = `opacity ${duration}ms`
  el.style.opacity = '0'
  setTimeout(() => {
    el.style.display = 'none'
  }, duration)
}

document.addEventListener('turbolinks:load', () => {
  const fadeable = document.querySelector('.alert')
  if (fadeable) {
    setTimeout(() => {
      fadeOut(fadeable)
    }, 6000)
  }
})


