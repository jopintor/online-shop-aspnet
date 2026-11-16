using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class DataHandler
    {
        // Read from Web.config so the app runs from any folder; |DataDirectory| resolves to App_Data.
        static string connStr = ConfigurationManager.ConnectionStrings["MasterFile"] != null
            ? ConfigurationManager.ConnectionStrings["MasterFile"].ConnectionString
            : "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\MasterFile.mdf;Integrated Security=True";
        SqlConnection conn = new SqlConnection(connStr);

        /// <summary>
        /// Checks a password against the stored value. Accounts that still hold a
        /// plain-text password are upgraded to a hash on their first successful login.
        /// </summary>
        public bool CheckPassword(string userID, string storedPassword, string password)
        {
            if (!PasswordHasher.Verify(password, storedPassword)) return false;

            if (!PasswordHasher.IsHashed(storedPassword))
            {
                ChangeUserPassword(userID, password);
            }

            return true;
        }

        public bool CheckEmail(string email)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetAccount", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@EmailAddress", SqlDbType.NVarChar).Value = email;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt.Rows.Count > 0;
        }

        public DataTable GetAccount(string email)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetAccount", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@EmailAddress", SqlDbType.NVarChar).Value = email;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public void CreateAccount(string email, string firstName, string lastName, string password)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("CreateAccount", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmailAddress", SqlDbType.NVarChar).Value = email;
            cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = firstName;
            cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = lastName;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = PasswordHasher.Hash(password);
            cmd.Parameters.Add("@Role", SqlDbType.NVarChar).Value = "User";
            cmd.Parameters.Add("@MembershipType", SqlDbType.NVarChar).Value = "Basic";
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void CreateProduct(string productID, string productName, string stocks, string price)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("CreateProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
            cmd.Parameters.Add("@ProductName", SqlDbType.NVarChar).Value = productName;
            cmd.Parameters.Add("@Stocks", SqlDbType.NVarChar).Value = stocks;
            cmd.Parameters.Add("@Price", SqlDbType.NVarChar).Value = price;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void UpdateProduct(string productNumber, string productID, string productName, string stocks, string price)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UpdateProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ProductNumber", SqlDbType.Int).Value = productNumber;
            cmd.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
            cmd.Parameters.Add("@ProductName", SqlDbType.NVarChar).Value = productName;
            cmd.Parameters.Add("@Stocks", SqlDbType.NVarChar).Value = stocks;
            cmd.Parameters.Add("@Price", SqlDbType.NVarChar).Value = price;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void DeleteProduct(string productNumber)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("DeleteProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ProductID", SqlDbType.Int).Value = productNumber;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public DataTable GetProducts()
        {
            SqlDataAdapter da = new SqlDataAdapter("GetProducts", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetAdmins()
        {
            SqlDataAdapter da = new SqlDataAdapter("GetAdminAccounts", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetUsers()
        {
            SqlDataAdapter da = new SqlDataAdapter("GetUserAccounts", conn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetUserTransactions(string ID)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetUserTransactionsBySaleCode", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@CustomerID", SqlDbType.Int).Value = ID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetUserByUserID(string ID)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetUserByUserID", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = ID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetUserTransaction(string ID)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetTransactionBySaleCode", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@SaleCode", SqlDbType.NVarChar).Value = ID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public bool checkIfCartHasItem(string userID, string productID)
        {
            SqlDataAdapter da = new SqlDataAdapter("CheckCart", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count == 0) return false;

            foreach (DataRow dr in dt.Rows)
            {
                if (dr["ProductID"].ToString() == productID) return true;
            }

            return false;
        }
        public void AddToCart(string userID, string productID)
        {
            if (checkIfCartHasItem(userID, productID))
            {
                SqlDataAdapter da = new SqlDataAdapter("CheckCart", conn);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
                DataTable dt = new DataTable();
                da.Fill(dt);

                int amount = 0;

                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ProductID"].ToString().Equals(productID)) amount = Convert.ToInt32(dr["Amount"].ToString());
                }

                conn.Open();
                SqlCommand cmd = new SqlCommand("UpdateCart", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
                cmd.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
                cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = (amount += 1);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("AddToCart", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
                cmd.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
                cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = 1;
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        public DataTable GetCart(string userID)
        {
            SqlDataAdapter da = new SqlDataAdapter("CheckCart", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetUserTransactionsByUserID(int userID)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetUserTransactionsByUserID", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetUserTransactionByUserID(string userID, string saleCode)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetTransactionByUserID", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
            da.SelectCommand.Parameters.Add("@SaleCode", SqlDbType.NVarChar).Value = saleCode;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetFinalUserCart(string userID)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetCartFinal", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetUserDiscount(string userID)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetDiscount", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }


        public void CreateTransaction(string saleCode, string productID, string customerID, string quantity, string pricePurchased, string purchaseDate, string finalPrice)
        {
            //Check Stocks
            SqlDataAdapter da = new SqlDataAdapter("GetProduct", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            //Execute transaction if there is enough stock for the purchase quantity
            if (Convert.ToInt32(dt.Rows[0]["Stocks"].ToString()) >= Convert.ToInt32(quantity))
            {
                //Make Transaction
                conn.Open();
                SqlCommand cmd = new SqlCommand("CreateTransaction", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@SaleCode", SqlDbType.NVarChar).Value = saleCode;
                cmd.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
                cmd.Parameters.Add("@CustomerID", SqlDbType.Int).Value = customerID;
                cmd.Parameters.Add("@Quantity", SqlDbType.Int).Value = quantity;
                cmd.Parameters.Add("@PricePurchased", SqlDbType.Money).Value = pricePurchased;
                cmd.Parameters.Add("@PurchaseDate", SqlDbType.DateTime).Value = purchaseDate;
                cmd.Parameters.Add("@FinalPrice", SqlDbType.Money).Value = finalPrice;
                cmd.ExecuteNonQuery();
                conn.Close();

                //Update ProductTable Stocks
                int newStock = Convert.ToInt32(dt.Rows[0]["Stocks"].ToString()) - Convert.ToInt32(quantity);
                UpdateProduct(dt.Rows[0]["ProductNumber"].ToString(), dt.Rows[0]["ProductID"].ToString(), dt.Rows[0]["ProductName"].ToString(), newStock.ToString(), dt.Rows[0]["Price"].ToString());
            }

        }

        public void ClearCart(string userID)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("ClearCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = userID;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void UpdateCart(string userID, string productID, string amount)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UpdateCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
            cmd.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
            cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = amount;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public DataTable GetProduct(string productID)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetProduct", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public DataTable GetCartItem(string userID, string productID)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetCartItem", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = userID;
            da.SelectCommand.Parameters.Add("@ProductID", SqlDbType.NVarChar).Value = productID;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }

        public void ChangeUserPassword(string userID, string password)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("UpdatePassword", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = userID;
            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = PasswordHasher.Hash(password);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public DataTable GetUserByEmail(string email)
        {
            SqlDataAdapter da = new SqlDataAdapter("GetUserByEmail", conn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add("@EmailAddress", SqlDbType.NVarChar).Value = email;
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
    }
}
