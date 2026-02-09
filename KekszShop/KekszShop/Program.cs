using AdatbazisTeszt.Database;
using KekszShop.Model;
using System.Data;
internal class Program
{
    public static readonly string connectionString = "Server=localhost;Database=kekszshop;User=root;";
    public static DataTable adatok = new DataTable();
    public static List<Termekek> termekekLista = new List<Termekek>();
    public static List<Felhasznalok> felhasznalokLista = new List<Felhasznalok>();
    public static List<Kategoria> kategoriaLista = new List<Kategoria>();
    private static void Main(string[] args)
    {
        DBCheck(connectionString);
        SelectFromTable("termekek", connectionString);
        AdatBetoltes(adatok);
        SelectFromTable("felhasznalo", connectionString);
        AdatBetoltes1(adatok);
        SelectFromTable("kategoria", connectionString);
        AdatBetoltes2(adatok);

        foreach (var item in termekekLista)
        {
            Console.WriteLine(item.Nev);
        }

    }

    private static void AdatBetoltes2(DataTable adatok)
    {
        foreach (DataRow o in adatok.Rows)
        {
            Kategoria kategoria = new Kategoria();

            kategoria.Id = o.Field<int>(0);
            kategoria.Nev = o.Field<string>(1);

            kategoriaLista.Add(kategoria);
        }
    }

    private static void AdatBetoltes1(DataTable adatok)
    {
        foreach (DataRow o in adatok.Rows)
        {
            Felhasznalok felhasznalok = new Felhasznalok();

            felhasznalok.Id = o.Field<int>(0);
            felhasznalok.Nev = o.Field<string>(1);
            felhasznalok.Jelszo = o.Field<string>(2);
            felhasznalok.Telefonszam = o.Field<string>(3);
            felhasznalok.Email = o.Field<string>(4);
            felhasznalok.Tuzesseg = o.Field<int>(5);

            felhasznalokLista.Add(felhasznalok);
        }
    }

    private static void AdatBetoltes(DataTable adatok)
    {
        
        foreach (DataRow o in adatok.Rows)
        {
            Termekek termekek = new Termekek();

            termekek.Id = o.Field<int>(0);
            termekek.Nev = o.Field<string>(1);
            termekek.Ar = o.Field<int>(2);
            termekek.Leiras = o.Field<string>(3);
            termekek.Tuzesseg = o.Field<int>(4);
            termekek.Kategoria_id = o.Field<int>(5);

            termekekLista.Add(termekek);
        }
    }

    private static void SelectFromTable(string tableName, string connectionString)
    {
        adatok = DatabaseService.GetAllData(tableName, connectionString);
    }

    private static void DBCheck(string connectionString)
    {
        DatabaseService.DbConnectionCheck(connectionString);
    }
}