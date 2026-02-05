using AdatbazisTeszt.Database;
using KekszShop.Model;
using System.Data;
internal class Program
{
    public static readonly string connectionString = "Server=localhost;Database=kekszshop;User=root;";
    public static DataTable adatok = new DataTable();
    public static List<Termekek> termékekLista = new List<Termekek>();
    private static void Main(string[] args)
    {
        DBCheck(connectionString);

    }
    private static void DBCheck(string connectionString)
    {
        DatabaseService.DbConnectionCheck(connectionString);
    }
}