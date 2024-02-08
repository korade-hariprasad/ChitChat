using System;
using Npgsql;

namespace Chat_CS {
    public class MainDB {
        private NpgsqlConnection conn;
        String conStr = "Server=localhost;Port=5432;User ID='postgres';Password='root';Database='chat';";

        public MainDB() {
            conn=new NpgsqlConnection(conStr);
            conn.Open();
        }

        public bool usernameExists(string uname) {
            String sql = "SELECT COUNT(*) FROM all_users WHERE uname = @username";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@username", uname);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            if(count>0) return true; else return false;
        }

        public bool insertNewUser(string uname, string psrd, string q, string ans) {
            String sql = "INSERT INTO all_users (uname, question, ans, pass) VALUES(@uname, @q, @a, @psrd)";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@uname", uname);
            cmd.Parameters.AddWithValue("@q", q);
            cmd.Parameters.AddWithValue("@a", ans);
            cmd.Parameters.AddWithValue("@psrd", psrd);
            if(cmd.ExecuteNonQuery()>0) return true; else return false;
        }

        public string getPass(string uname) {
            String sql = "SELECT pass FROM all_users WHERE uname = @name";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", uname);
            object result = cmd.ExecuteScalar();
            if(result!=null) return (result.ToString());
            else return null;
        }

        public int getId(string uname) {
            String sql = "SELECT uid FROM all_users WHERE uname = @name";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", uname);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }

        public string getUname(int id) {
            String sql = "SELECT uname FROM all_users WHERE uid = @id";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            object result = cmd.ExecuteScalar();
            if(result!=null) return (result.ToString());
            else return null;
        }
        public string getQuestion(string uname) {
            String sql = "SELECT question FROM all_users WHERE uname = @name";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", uname);
            object result = cmd.ExecuteScalar();
            if(result!=null) return (result.ToString());
            else return null;
        }

        public string getAns(string uname) {
            String sql = "SELECT ans FROM all_users WHERE uname = @name";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", uname);
            object result = cmd.ExecuteScalar();
            if(result!=null) return (result.ToString());
            else return null;
        }

        public bool updatePass(string uname, string pass) {
            string sql = "UPDATE all_users SET pass = @pass WHERE uname = @uname";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@pass", pass);
            cmd.Parameters.AddWithValue("@uname", uname);
            if(cmd.ExecuteNonQuery()>0) return true; else return false;
        }

        public NpgsqlDataReader getReader(int id) {
            string sql = @"
                SELECT uname FROM all_users WHERE uid <> @id
                AND uid NOT IN (
                    SELECT a AS friend_id FROM friends WHERE b = @id
                    UNION
                    SELECT b AS friend_id FROM friends WHERE a = @id
                ) AND uid NOT IN (SELECT b FROM requests WHERE a = @id)
            ";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteReader();
        }

        public void sendRequest(int a, int b) {
            String sql = "INSERT INTO requests VALUES(@a, @b)";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@a", a);
            cmd.Parameters.AddWithValue("@b", b);
            cmd.ExecuteScalar();
        }

        public NpgsqlDataReader getRequests(int id) {
            string sql = "SELECT a FROM requests WHERE b = @id";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteReader();
        }

        public void addFriend(int a, int b) {
            String sql = "INSERT INTO friends VALUES(@a, @b)";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@a", a);
            cmd.Parameters.AddWithValue("@b", b);
            cmd.ExecuteScalar();
        }

        public void removeRequest(int a, int b) {
            String sql = "DELETE FROM requests WHERE(a = @a AND b = @b) OR (a = @b AND b = @a);";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@a", a);
            cmd.Parameters.AddWithValue("@b", b);
            cmd.ExecuteScalar();
        }

        public void createChat(int a, int b) {
            string t_name = "t"+(a+b).ToString();
            String sql = "CREATE TABLE "+t_name+" (sender INT REFERENCES all_users(uid), msg VARCHAR, at VARCHAR);";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
        }

        public NpgsqlDataAdapter getChat(int id) {
            string t = "t"+id.ToString();
            string sql = "SELECT * FROM "+t+" ORDER BY TO_TIMESTAMP(at, 'DD-MM HH24:MI') DESC;";
            return new NpgsqlDataAdapter(sql, conn);
        }

        public NpgsqlDataReader getFriends(int id) {
            string sql = "SELECT b AS friend_id FROM friends WHERE a = @id UNION SELECT a AS friend_id FROM friends WHERE b = @id;";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            return cmd.ExecuteReader();
        }

        public void insertIntoChat(int a, int b, string msg, string at) {
            string t = "t"+(a+b).ToString();
            string sql = "INSERT INTO "+t+" VALUES (@a, @msg, @at)";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@t", t);
            cmd.Parameters.AddWithValue("@a", a);
            cmd.Parameters.AddWithValue("@msg", msg);
            cmd.Parameters.AddWithValue("@at", at);
            cmd.ExecuteScalar();
        }

        public string getRequestCountOf(int id) {
            string c = null;
            string sql = "SELECT COUNT(b) FROM requests WHERE b = @id";
            NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            using(NpgsqlDataReader reader = cmd.ExecuteReader()) {
                if(reader.Read()) {
                    c=reader[0].ToString();
                }
            }
            return c;
        }
    }
}