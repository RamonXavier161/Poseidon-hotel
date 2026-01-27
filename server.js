//tentativa de criar um servidor node para salvar as fotos esta funcionando, lembrar de iniciar o servidor com node server.js
const express = require("express"); //criar servidor
const multer = require("multer");  //recebe os arquivos
const mysql = require("mysql2"); //conexao com o banco
const path = require("path"); //ajuda comtipos de imagens 
const cors = require("cors"); //liberar acesso entre dominios diferentes

// aqui começa o servidor e o cors permite a ligação entre dominios diferentes (localhost:3000 e localhost na porta 84 com o iis)
const app = express();
app.use(cors());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "adm123",
  database: "hotel"
});

app.use("/uploads", express.static("uploads"));

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/quartos/");
  },
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    const nomeUnico = Date.now() + ext;
    cb(null, nomeUnico);
  }
});

const upload = multer({ storage });
// pelo oque pesquisei o upload.array permite multiplos arquivos com o maximo de 10
app.post("/upload", upload.array("fotos", 10), (req, res) => {
  const nomeFoto = req.body.nome_foto;
  const quarto = req.body.quarto;

  if (!req.files || req.files.length === 0) {
    return res.send("Nenhuma imagem enviada.");
  }

  req.files.forEach(file => {
    const caminho = "uploads/quartos/" + file.filename;

    const sql = "INSERT INTO fotos (nome_foto, caminho, quarto) VALUES (?, ?, ?)";
    db.query(sql, [nomeFoto, caminho, quarto], (err) => {
      if (err) console.error("Erro ao salvar no banco:", err);
    });
  });
    // lembrar de trocar a porta sempre 
    res.send("<script>alert('Fotos salvas com sucesso!'); window.location.href='http://localhost:84/foto.asp';</script>");
});

app.listen(3000, () => console.log("Servidor rodando na porta 3000"));
