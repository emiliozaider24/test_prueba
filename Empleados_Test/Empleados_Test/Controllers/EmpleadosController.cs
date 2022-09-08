using Empleados_Test.Commands;
using Empleados_Test.Models;
using System;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using static Empleados_Test.Models.EmployeeS;

namespace Empleados_Test.Controllers
{
    public class EmpleadosController : Controller
    {
        

        public ActionResult Index()//muestra los usuarios Activos vista
        {

           
            TablaEmpleados sp_empleados = new TablaEmpleados();
            var listaEmpleados = sp_empleados.Mostrar_Empleados();
            //agregamos la lista que mostrara el nombre del empleado
            var lEmpleados = listaEmpleados.ToList();
            var L_emp = new SelectList(lEmpleados, dataValueField: "Name", dataTextField: "Name").ToList();//llena el DropDownlist            
            ViewBag.L_Empleados = L_emp;
            ViewBag.DEmpleados = "Selecciona un empleado";
            return View(listaEmpleados.ToList().OrderByDescending(x=>x.BornDate));
        }

        

      
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Employee empleado)
        {
            if (!ModelState.IsValid)
            {
                return View("Create",empleado);
            }

            string nombre="", apellidop="", apellidom="", anio="", mes="", dia="", rfc="";
            //validamos el rfc
            if(empleado.Name!=null &&empleado.Name.Length>=2)
            {
                 nombre = empleado.Name.ToUpper().Substring(0, 1);
            }

            if (empleado.LastName != null && empleado.LastName.Length >= 2)
            {
                 apellidop = empleado.LastName.ToUpper().Substring(0, 2);
            }

            if (empleado.M_LastName != null && empleado.M_LastName.Length >= 2)
            {
                 apellidom = empleado.M_LastName.ToUpper().Substring(0, 1);
            }

            if (empleado.BornDate != null)
            {
                var fecha = Convert.ToString(empleado.BornDate);
                dia = fecha.Substring(0, 2);
                mes= fecha.Substring(3,2);
                anio= fecha.Substring(8,2);
            }
            string c_rfc = apellidop + apellidom + nombre + anio + mes + dia;
            //validamos que el rfc tenga el formato correcto y que corresponda con los datos proporcinados
            if (empleado.RFC!=null && empleado.RFC.Length>=12)
            {
                rfc = empleado.RFC.ToUpper();
               
               if( Regex.IsMatch(rfc.Substring(0,4), @"^[a-zA-Z]+$"))
                {
                    if( Regex.IsMatch(rfc.Substring(4,6), @"^[0-9]+$"))
                        {
                        if (c_rfc != rfc.Substring(0,10))
                        {
                            //mandamos un alert indicando que el RFC no tiene el formato correcto
                            ViewBag.Message = string.Format("datos_incorrectos");
                            return View("Create", empleado);
                        }
                        else
                        {
                            //VALIDAMOS QUE EL RFC NO EXISTA ANTERIORMENTE 
                            

                            TablaEmpleados sp_Empleados = new TablaEmpleados();
                            var comparacion=sp_Empleados.Mostrar_Empleados().Where(x => x.RFC == empleado.RFC.ToUpper() &&x.Name==empleado.Name.ToUpper()&&
                            x.LastName==empleado.LastName.ToUpper()&&x.M_LastName==empleado.M_LastName.ToUpper()).ToList();
                            if(comparacion.Count==0)
                            {

                                sp_Empleados.Alta_Empleados(empleado);

                                return RedirectToAction("Index");
                            }
                            else
                            {
                                ViewBag.Message = string.Format("Empleado_registrado");
                                return View("Create", empleado);
                            }



                        }
                    }
                    else
                    {
                        ViewBag.Message = string.Format("RFC_incorrecto");
                        return View("Create", empleado);
                    }
                }
               
            }
            return View("Create", empleado);
        }


       
        public ActionResult Edit(int id)
        {

            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            if (id == 0)
            {
                return HttpNotFound();
            }

            TablaEmpleados empleado = new TablaEmpleados();

            var oEmpleado = empleado.Mostrar_Empleados_Mod(id);
            return View(oEmpleado);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Employee empleado)
        {
            TablaEmpleados oEmpleado = new TablaEmpleados();
            if (ModelState.IsValid)
            {
                oEmpleado.Alta_Empleados(empleado);
                return RedirectToAction("Index");
            }


            return View(empleado);
        }


       
        public ActionResult Delete(int id)
        {
            TablaEmpleados empleado = new TablaEmpleados();

            var oEmpleado = empleado.Mostrar_Empleados_Mod(id);
            return View(oEmpleado);         
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TablaEmpleados oEmpleado = new TablaEmpleados();
        
            oEmpleado.Actualiza_Estatus_Empleados(id, EmployeeStatus.Inactive);
            return RedirectToAction("Index");
        }


        public ActionResult Filtrar(string S_Nombre)
        {
            TablaEmpleados oEmpleados = new TablaEmpleados();
            var empleado = oEmpleados.Mostrar_Empleados();

            if (S_Nombre=="")
            {
                ViewBag.Message = string.Format("no_seleccion");
                return View("Index", empleado.ToList());
            }
            S_Nombre.Replace(" ", String.Empty);
            S_Nombre = S_Nombre.ToUpper();
            
            return View("Index",empleado.Where(x=>x.Name==S_Nombre).ToList());
        }

        public ActionResult Limpiar()
        {

            return RedirectToAction("Index");
        }
    }
}
