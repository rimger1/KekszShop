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

    public static string felirat = @"
     __    __  ________  __    __   ______   ________   ______   __    __   ______   _______  
    |  \  /  \|        \|  \  /  \ /      \ |        \ /      \ |  \  |  \ /      \ |       \ 
    | $$ /  $$| $$$$$$$$| $$ /  $$|  $$$$$$\ \$$$$$$$$|  $$$$$$\| $$  | $$|  $$$$$$\| $$$$$$$\
    | $$/  $$ | $$__    | $$/  $$ | $$___\$$    /  $$ | $$___\$$| $$__| $$| $$  | $$| $$__/ $$
    | $$  $$  | $$  \   | $$  $$   \$$    \    /  $$   \$$    \ | $$    $$| $$  | $$| $$    $$
    | $$$$$\  | $$$$$   | $$$$$\   _\$$$$$$\  /  $$    _\$$$$$$\| $$$$$$$$| $$  | $$| $$$$$$$ 
    | $$ \$$\ | $$_____ | $$ \$$\ |  \__| $$ /  $$___ |  \__| $$| $$  | $$| $$__/ $$| $$      
    | $$  \$$\| $$     \| $$  \$$\ \$$    $$|  $$    \ \$$    $$| $$  | $$ \$$    $$| $$      
     \$$   \$$ \$$$$$$$$ \$$   \$$  \$$$$$$  \$$$$$$$$  \$$$$$$  \$$   \$$  \$$$$$$  \$$      
    ";

    private static void Main(string[] args)
    {


        DBCheck(connectionString);
        SelectFromTable("termekek", connectionString);
        AdatBetoltes(adatok);
        SelectFromTable("felhasznalo", connectionString);
        AdatBetoltes1(adatok);
        SelectFromTable("kategoria", connectionString);
        AdatBetoltes2(adatok);

        KategoriakKiir();





        Uresorok(5);
    }

    private static void KategoriakKiir()
    {
        int kategoriaIdx = 0;
        int termekIdx = 0;
        bool termekMenu = false;

        while (true)
        {
            Console.Clear();
            Console.WriteLine(felirat);
            Uresorok(1);

            if (!termekMenu)
            {
                Console.WriteLine("KATEGÓRIÁK");
                Uresorok(1);

                for (int i = 0; i < kategoriaLista.Count; i++)
                {
                    if (i == kategoriaIdx)
                        Console.WriteLine($"> {kategoriaLista[i].Nev}");
                    else
                        Console.WriteLine($"  {kategoriaLista[i].Nev}");
                }
            }
            else
            {
                var kategoria = kategoriaLista[kategoriaIdx];

                List<Termekek> valasztottKat = new List<Termekek>();
                foreach (var t in termekekLista)
                {
                    if (t.Kategoria_id == kategoria.Id)
                        valasztottKat.Add(t);
                }

                Console.WriteLine($"KATEGÓRIA: {kategoria.Nev}");
                Uresorok(1);

                for (int i = 0; i < valasztottKat.Count; i++)
                {
                    if (i == termekIdx)
                        Console.WriteLine($"> {valasztottKat[i].Nev}");
                    else
                        Console.WriteLine($"  {valasztottKat[i].Nev}");
                }
            }

            var key = Console.ReadKey(true).Key;

            if (!termekMenu)
            {
                if (key == ConsoleKey.UpArrow)
                {
                    kategoriaIdx--;
                    if (kategoriaIdx < 0) kategoriaIdx = kategoriaLista.Count - 1;
                }
                else if (key == ConsoleKey.DownArrow)
                {
                    kategoriaIdx++;
                    if (kategoriaIdx >= kategoriaLista.Count) kategoriaIdx = 0;
                }
                else if (key == ConsoleKey.Enter)
                {
                    termekIdx = 0;
                    termekMenu = true;
                }
                else if (key == ConsoleKey.Escape)
                {
                    break;
                }
            }
            else
            {
                var kategoria = kategoriaLista[kategoriaIdx];
                List<Termekek> valasztottKat = new List<Termekek>();

                foreach (var t in termekekLista)
                {
                    if (t.Kategoria_id == kategoria.Id)
                        valasztottKat.Add(t);
                }

                if (key == ConsoleKey.UpArrow)
                {
                    termekIdx--;
                    if (termekIdx < 0) termekIdx = valasztottKat.Count - 1;
                }
                else if (key == ConsoleKey.DownArrow)
                {
                    termekIdx++;
                    if (termekIdx >= valasztottKat.Count) termekIdx = 0;
                }
                else if (key == ConsoleKey.Enter)
                {
                    var termek = valasztottKat[termekIdx];
                    Console.Clear();

                    Console.WriteLine("TERMÉK ADATAI");
                    Uresorok(1);
                    Console.WriteLine($"Név: {termek.Nev}");
                    Console.WriteLine($"Ár: {termek.Ar} Ft");
                    Console.WriteLine($"Leírás: {termek.Leiras}");
                    Console.WriteLine($"Tüzesség: {termek.Tuzesseg}");

                    Uresorok(1);
                    Console.WriteLine("Vissza (esc)");
                    Console.ReadKey(true);
                }
                else if (key == ConsoleKey.Escape)
                {
                    termekMenu = false;
                }
            }
        }
}

    private static void Uresorok(int v)
    {
        for (int i = 0; i < v; i++)
        {
            Console.WriteLine();
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






/*
using System;
using System.Collections.Generic;
 
class Program
{
    static void Main()
    {
        Dictionary<string, List<string>> categories = new Dictionary<string, List<string>>()
        {
            { "Ital", new List<string> { "Víz", "Kóla", "Sör" } },
            { "Étel", new List<string> { "Pizza", "Burger", "Saláta" } },
            { "Elektronika", new List<string> { "Laptop", "Telefon", "Fülhallgató" } }
        };

        List<string> categoryList = new List<string>(categories.Keys);
        int selectedIndex = 0;

        while (true)
        {
            Console.Clear();
            Console.WriteLine("Válassz egy kategóriát (nyilakkal, Enter a kiválasztáshoz, Esc a kilépéshez):\n");

            // Menüpontok kiírása
            for (int i = 0; i < categoryList.Count; i++)
            {
                if (i == selectedIndex)
                    Console.WriteLine($"> {categoryList[i]}"); // kijelölt
                else
                    Console.WriteLine($"  {categoryList[i]}");
            }
KESZ

            // Billentyű olvasása
            var key = Console.ReadKey(true).Key;

            if (key == ConsoleKey.UpArrow)
            {
                selectedIndex--;
                if (selectedIndex < 0) selectedIndex = categoryList.Count - 1;
            }
            else if (key == ConsoleKey.DownArrow)
            {
                selectedIndex++;
                if (selectedIndex >= categoryList.Count) selectedIndex = 0;
            }
            else if (key == ConsoleKey.Enter)
            {
                Console.Clear();
                string chosenCategory = categoryList[selectedIndex];
                Console.WriteLine($"A(z) {chosenCategory} kategória termékei:\n");
                foreach (var product in categories[chosenCategory])
                {
                    Console.WriteLine("- " + product);
                }
                Console.WriteLine("\nNyomj egy gombot a visszatéréshez a menübe...");
                Console.ReadKey();
            }
            else if (key == ConsoleKey.Escape)
            {
                break; // kilépés
            }
        }
    }
}*/