using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Empleados_Test.Models;
using Empleados_Test.Services;
using MySql.Data.MySqlClient;
using static Empleados_Test.Models.EmployeeS;

namespace Empleados_Test.Commands
{
    public class TablaEmpleados
    {
        static DataBaseConexion cadena = new DataBaseConexion();
        public List<Employee> Mostrar_Empleados()
        {

            List<Employee> lista = new List<Employee>();

            string connectionString = cadena.Conexion;

            // Utiliza dispose al finalizar bloque
            using (MySqlConnection conexion = new MySqlConnection(connectionString))
            {
                conexion.Open();

                // Comandos
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "muestra_empleados_sp";

                // Lectura de datos
                using (var reader = cmd.ExecuteReader())
                {
                    // Respuesta
                    var empleado = new Employee();

                    while (reader.Read())
                    {
                        lista.Add(new Employee()
                        {
                            ID = Convert.ToInt32(reader["id"]),
                            Name = reader["NameE"].ToString(),
                            LastName = reader["Last_Name"].ToString(),
                            M_LastName = reader["M_Last_Name"].ToString(),
                            RFC = reader["RFC"].ToString(),
                            BornDate = Convert.ToDateTime(reader["Born_Date"].ToString())

                        });

                    }

                    return lista;
                }
            }
        }

            public void Alta_Empleados(Employee empleado)
            {
               
                string connectionString = cadena.Conexion;


                // Utiliza dispose al finalizar bloque
                using (MySqlConnection conexion = new MySqlConnection(connectionString))
                {
                    // Comandos
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = conexion;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "alta_empleado_sp";

                // Parametros de SP
                    cmd.Parameters.AddWithValue("eid",empleado.ID);
                    cmd.Parameters.AddWithValue("eName", empleado.Name.ToUpper());
                    cmd.Parameters.AddWithValue("eLastName", empleado.LastName.ToUpper());
                    cmd.Parameters.AddWithValue("MLastName", empleado.M_LastName.ToUpper());
                    cmd.Parameters.AddWithValue("eRFC", empleado.RFC.ToUpper());
                    cmd.Parameters.AddWithValue("eBornDate", empleado.BornDate.ToString("yyyy-MM-dd HH:mm:ss"));
                // Cierre General
                    conexion.Open();
                    int res = cmd.ExecuteNonQuery();
                    conexion.Close();
                    cmd = null;
                }
            }


        public Employee Mostrar_Empleados_Mod(int id)
        {

            Employee oEmpleado = new Employee();

            string connectionString = cadena.Conexion;

            // Utiliza dispose al finalizar bloque
            using (MySqlConnection conexion = new MySqlConnection(connectionString))
            {
                // Comandos
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "muestra_empleadomod_sp";
                //parametros
                cmd.Parameters.AddWithValue("eid", id);
                conexion.Open();
                var leer = cmd.ExecuteReader();

                while (leer.Read())
                {


                    oEmpleado.ID = Convert.ToInt32(leer["id"]);
                    oEmpleado.Name = leer["NameE"].ToString();
                    oEmpleado.LastName = leer["Last_Name"].ToString();
                    oEmpleado.M_LastName = leer["M_Last_Name"].ToString();
                    oEmpleado.RFC = leer["RFC"].ToString();
                    oEmpleado.BornDate = Convert.ToDateTime(leer["Born_Date"].ToString());
                }
                conexion.Close();//cierra conexion
                leer.Close();//cierra lista
               
            }

            return oEmpleado;
        }
            
        


        public void Actualiza_Estatus_Empleados(int id, EmployeeStatus status)
        {

            string connectionString = cadena.Conexion;


            // Utiliza dispose al finalizar bloque
            using (MySqlConnection conexion = new MySqlConnection(connectionString))
            {
                // Comandos
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conexion;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "actualiza_status_empleado_sp";

                // Parametros de SP
                cmd.Parameters.AddWithValue("eid",id);
                cmd.Parameters.AddWithValue("empstatus", status);
           
                // Cierre General
                conexion.Open();
                int res = cmd.ExecuteNonQuery();
                conexion.Close();
                cmd = null;
            }
        }


    }
}