using API.Entities;
using API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EventController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EventModel>>> GetEvent()
        {
            using (var db = new DbPersonellManagementContext())
            {
                var list = await db.Events.Include(p => p.Calendar).Include(p => p.Calendar.Employee).ToListAsync();
                var eventModelsList = list.ConvertAll(p => new EventModel(p));
                return Ok(eventModelsList);
            }
        }
    }
}
