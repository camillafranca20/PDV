package Utilitarios;

import java.sql.*;
import javax.swing.JOptionPane;

public class conexao {

    final private String driver = "com.mysql.jdbc.Driver";
    final private String url = "jdbc:mysql://localhost/pdv";
    final private String usuario = "root";
    final private String senha = "";
    private Connection conexao;
    public Statement statement;
    public ResultSet resultset;

    public boolean conecta() {
        boolean result = true;
        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, usuario, senha);
            JOptionPane.showMessageDialog(null, "Conexão estabelecida!");
        } catch (ClassNotFoundException Driver) {
            JOptionPane.showMessageDialog(null, "\nDriver não localizado!\nErro: " + Driver);
            result = false;
        } catch (SQLException Fonte) {
            JOptionPane.showMessageDialog(null, "\nFonte de dados não localizada!\nErro: " + Fonte);
            result = false;
        }
        return result;
    }

    public void desconecta() {
        try {
            conexao.close();
            JOptionPane.showMessageDialog(null, "Conexão com o banco fechada!");
        } catch (SQLException fecha) {
            JOptionPane.showMessageDialog(null, "\nErro no fechamento do bd!\nErro: " + fecha);
        }
    }

    public void executaSQL(String sql) {
        try {

            statement = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = statement.executeQuery(sql);
        } catch (SQLException excecao) {
            JOptionPane.showMessageDialog(null, "\nErro no comando SQL!\nErro: " + excecao + "" + "\nComando SQL passado: " + sql);
        }
    }

    public void zerarBD() {

        int i = JOptionPane.showConfirmDialog(null, "Deseja realmente Apagar TODOS OS DADOS?", "Atenção", JOptionPane.YES_NO_OPTION, 2);
        if (i == 0) {
            try {
                statement = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
                conexao.createStatement().executeUpdate("drop database clientes");
                JOptionPane.showMessageDialog(null, "\nComando concluído com êxito!\n");
            } catch (SQLException excecao) {
                JOptionPane.showMessageDialog(null, "\nErro no comando SQL!\nErro: " + excecao);
            }
        } else {
            JOptionPane.showMessageDialog(null, "\nOperação cancelada pelo usuário!\n");
        }
    }
    
 public static void main (String[] args){
     conexao con = new conexao();
     con.conecta();
 }    
    
    
}