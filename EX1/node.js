const express = require('express')
const app = express()
const port = 3000

app.set(`views engine`, `ejs`)
app.get('/', (req, res) => {
  res.send("hello word")
})

app.get('/profile', (req, res) => {
   const nama = "gabid";
   res.render('profile.ejs', {
    nama: nama,
    alamat: "wakanda",
   })
})
app.get('/about', (req, res) => {
  res.render('about.ejs');
})
app.listen(port, () => {
  console.log(`example app listening on port ${port}`)
})