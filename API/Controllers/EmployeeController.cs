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

        [HttpPatch]
        public async Task<ActionResult> PatchEmployee(EmployeeRequest request)
        {
            using (var db = new DbPersonellManagementContext())
            {
                if (request == null)
                {
                    return BadRequest("Переданы неверные данные");
                }

                var existingEmployee = await db.Employees.FirstOrDefaultAsync(e => e.EmployeeId == request.EmployeeId);
                if (existingEmployee == null)
                {
                    return NotFound("Сотрудник не найден");
                }

                existingEmployee.FirstName = request.FirstName;
                existingEmployee.LastName = request.LastName;
                existingEmployee.Email = request.Email;
                existingEmployee.Office = request.Office;
                existingEmployee.PositionId = request.PositionId;
                existingEmployee.DepartmentId = request.DepartmentId;
                existingEmployee.SupervisorId = request.SupervisorId;
                existingEmployee.AssistantId = request.AssistantId;
                existingEmployee.BirthDate = request.BirthDate;
                existingEmployee.WorkPhone = request.WorkPhone;
                existingEmployee.AdditionalInfo = request.AdditionalInfo;
                existingEmployee.MobilePhone = request.MobilePhone;
                await db.SaveChangesAsync();
                return Ok("Данные сотрудника изменены!");
            }
        }
    }
}
