using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Empleados_Test.Services
{
    public class DataBaseConexion
    { 
        static string servidor = "127.0.0.1";
        static string bd = "empleados_tec";
        static string user = "root";
        static string password = "123456";
        static string puerto = "3306";
        static  string cadenaConexion = "server=" + servidor + "; " + "port=" + puerto + "; " + "Uid=" + user + "; " + "pwd=" + password + "; " + "database=" + bd + ";";
        public string Conexion { get; set; }=cadenaConexion;
    }
}