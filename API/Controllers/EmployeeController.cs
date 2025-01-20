using API.Entities;
using API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EmployeeModel>>> GetEmployees()
        {
            using (var db = new DbPersonellManagementContext())
            {
                var list = await db.Employees.Include(p => p.Position).Include(p => p.Department).ToListAsync();
                var employeeModels = list.ConvertAll(p => new EmployeeModel(p));
                return Ok(employeeModels); // Возвращаем результат
            }
        }

        [HttpGet("id")]
        public async Task<ActionResult<EmployeeModel>> GetEmployeeId(int id)
        {
            using (var db = new DbPersonellManagementContext())
            {
                if(id == 0 || id < 0)
                    return NotFound();

                var list = await db.Employees.Include(p => p.Position).Include(p => p.Department).Where(p => p.EmployeeId == id).ToListAsync();
                var employeeModels = list.ConvertAll(p => new EmployeeModel(p));
                return Ok(employeeModels); // Возвращаем результат
            }
        }
    }
}
