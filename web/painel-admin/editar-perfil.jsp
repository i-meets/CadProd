<%@page import="util.Upload" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="util.Conexao"%>

<%
    Statement st = null;
    ResultSet rs = null;

    String nome = "";
    String cpf = "";
    String email = "";
    String senha = "";
    String imagem = null;

    String id = "";
    String antigo = "";

    Upload up = new Upload();

//definir qual a pasta a ser salva
    up.setFolderUpload("sistema/img/profiles");

    if (up.formProcess(getServletContext(), request)) {

        try {

            nome = up.getForm().get("nome").toString();
            cpf = up.getForm().get("cpf").toString();
            email = up.getForm().get("email").toString();
            senha = up.getForm().get("senha").toString();

            id = up.getForm().get("txtid").toString();
            out.print(cpf);
            antigo = up.getForm().get("antigo").toString();
            out.print(antigo);
            imagem = up.getFiles().get(0).toString();

        } catch (Exception e) {
            imagem = "sem-foto.jpg";

        }
        

        //INSERIR OS DADOS NO BANCO DE DADOS
        try {

            //verificar se o campo é vazio
            if (nome.equals("")) {
                out.print("Preencha o Campo Nome!!");
                return;
            }

            if (cpf.equals("")) {
                out.print("Preencha o Campo CPF!!");
                return;
            }

            st = new Conexao().conectar().createStatement();

            //VERIFICAR SE JA EXISTE UM REGISTRO COM ESTE DADO NO BANCO
            rs = st.executeQuery("SELECT * FROM usuarios where cpf = '" + cpf + "' and id <> '" + id + "'");
            out.print("dados: " + cpf + "  " + id);
            if (rs.next()) {
                out.print("CPF Já Cadastrado!");
                return;
            }

            if (senha.equals("")) {
                if (imagem.equals("sem-foto.jpg")) {
                    st.executeUpdate("UPDATE usuarios SET nome = '" + nome + "', cpf = '" + cpf + "', email = '" + email + "' WHERE id = '" + id + "'");
                } else {
                    st.executeUpdate("UPDATE usuarios SET nome = '" + nome + "', cpf = '" + cpf + "', email = '" + email + "', foto = '" + imagem + "' WHERE id = '" + id + "'");
                }
            } else {
                if (imagem.equals("sem-foto.jpg")) {
                    st.executeUpdate("UPDATE usuarios SET nome = '" + nome + "', cpf = '" + cpf + "', email = '" + email + "' senha = '" + senha + "' WHERE id = '" + id + "'");
                } else {
                    st.executeUpdate("UPDATE usuarios SET nome = '" + nome + "', cpf = '" + cpf + "', email = '" + email + "' senha = '" + senha + "', foto = '" + imagem + "' WHERE id = '" + id + "'");
                }
            }

            out.print("Salvo com Sucesso!!");
        } catch (Exception e) {
            out.print(e);
        }

    }

%>