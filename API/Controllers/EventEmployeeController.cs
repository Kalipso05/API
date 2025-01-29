using API.Entities;
using API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventEmployeeController : ControllerBase
    {
        [HttpGet("id")]
        public async Task<ActionResult<IEnumerable<EventEmployeeModel>>> GetEventEmployee(int id)
        {
            using (var db = new DbPersonellManagementContext())
            {
                var events = await db.EventEmployees.Include(e => e.EventEmployeeType).Where(e => e.EmployeeId == id).ToListAsync();
                if (events == null)
                {
                    return NotFound("Событие сотрудника не найдены");
                }
                return Ok(events.ConvertAll(p => new EventEmployeeModel(p)));

            }
        }

        [HttpPost]
        public async Task<ActionResult> PostEventEmployee(EventEmployeeRequest employee)
        {
            using (var db = new DbPersonellManagementContext())
            {
                if (employee != null)
                {
                    var events = new EventEmployee()
                    {
                        DateEnd = employee.DateEnd,
                        EmployeeId = employee.EmployeeId,
                        DateStart = employee.DateStart,
                        EventEmployeeTypeId = employee.EventEmployeeTypeId,
                        
                    };
                    await db.AddAsync(events);
                    await db.SaveChangesAsync();
                    return Ok();
                }
                return BadRequest();
            }
        }
    }
}
