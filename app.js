const express = require('express');
const app = express();
const port = 3000;

app.set('view engine', 'ejs');
var connection = require('./database');
var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({ extended: false }));

app.get('/', (req, res) => {
    connection.query('SELECT * FROM siswa', function(err, rows){
        if(err){
            req.flash('error', err);
            res.render('index', {
                data: ''
            });
        }else{
            res.render('index', {
                data: rows
            });
        }
    });
});

app.get('/insert', (req, res)=>{
    res.render('form', {
        nis: '',
        nama: '',
        kelas: '',
        form: 'simpan',
        tombol: 'Simpan',
    });
});

app.post('/simpan', function (req, res, next){
    const NIS = req.body.nis;
    const nama_siswa = req.body.nama;
    const alamat_siswa = req.body.kelas;

    const data = {
        NIS: NIS,
        nama_siswa: nama_siswa,
        alamat_siswa: alamat_siswa,
    };

    connection.query('INSERT into siswa SET ?', data, function(err, result){
        if (err){
            console.log(err);
        } else {
            res.redirect('/');
        }
    });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

app.get('/edit/:NIS', (req, res) => {
    const NIS = req.params.NIS;
    connection.query('SELECT * FROM siswa WHERE NIS = ?', [NIS], function(err, rows){
        if(err || rows.length === 0){
            req.flash('error', 'Data siswa tidak ditemukan');
            res.redirect('/');
        } else {
            res.render('edit', {
                data: rows[0]
            });
        }
    });
});

// Endpoint untuk meng-handle edit data
app.post('/edit/:NIS', function (req, res, next){
    const NIS = req.params.NIS;
    const nama_siswa = req.body.nama_siswa;
    const alamat_siswa = req.body.alamat_siswa;

    const data = {
        nama_siswa: nama_siswa,
        alamat_siswa: alamat_siswa,
    };
    connection.query('UPDATE siswa SET ? WHERE NIS = ?', [data, NIS], function(err, result){
        if (err){
            console.log(err);
        } else {
            res.redirect('/');
        }
    });
});

// Endpoint untuk halaman konfirmasi hapus
app.get('/delete/:NIS', (req, res) => {
    const NIS = req.params.NIS;
    connection.query('SELECT * FROM siswa WHERE NIS = ?', [NIS], function(err, rows){
        if(err || rows.length === 0){
            req.flash('error', 'Data siswa tidak ditemukan');
            res.redirect('/');
        } else {
            res.render('delete', {
                data: rows[0]
            });
        }
    });
});

// Endpoint untuk meng-handle hapus data
app.post('/delete/:NIS', function (req, res, next){
    const NIS = req.params.NIS;
    connection.query('DELETE FROM siswa WHERE NIS = ?', [NIS], function(err, result){
        if (err){
            console.log(err);
        } else {
            res.redirect('/');
        }
    });
});
