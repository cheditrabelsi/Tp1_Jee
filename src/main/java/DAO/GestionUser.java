package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import model.Produit;
import model.User;

public class GestionUser {
	public User getUser(String ref) {
		java.sql.Connection conn=SingletonConnection.getConnection();
User u=new User();
try {

		java.sql.PreparedStatement ps= conn.prepareStatement("select * from user where login=?");
		ps.setString(1,ref);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			//list.add(new Produit(rs.getInt("id"),rs.getString("nom_p"),rs.getFloat("prix"),rs.getString("fournisseur")));
			u.setLogin(rs.getString(1));
		u.setPass(rs.getString(2));
		u.setProfile(rs.getString(3));
		
		}
		ps.close();
		} catch (SQLException e)
		{
		e.printStackTrace();
		}
		return u;
	}
	public boolean exist(User u)
	{
		Connection conn = (Connection) SingletonConnection.getConnection();
		try {

			PreparedStatement ps = (PreparedStatement) conn.prepareStatement("select * from user where login= ? and pass = ?");

			ps.setString(1, u.getLogin());
			ps.setString(2, u.getPass());
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				return true;
			}

			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public User save(User u) {
		java.sql.Connection conn=SingletonConnection.getConnection();
		try {

		java.sql.PreparedStatement ps= conn.prepareStatement("INSERT INTO user VALUES(?,?,?)");

		ps.setString(1, u.getLogin());
		ps.setString(2, u.getPass());
		ps.setString(3, u.getProfile());
		ps.executeUpdate();
		ps.close();
		} catch (SQLException e)
		{
		e.printStackTrace();
		}
		return u;
		}
}
