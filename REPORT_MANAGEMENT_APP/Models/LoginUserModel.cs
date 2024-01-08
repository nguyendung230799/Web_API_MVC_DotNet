using AutoMapper;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class LoginUserModel : Profile
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public int? UsernameChangeLimit { get; set; } = 10;
        public string Email { get; set; }
        public string ConcurrencyStamp { get; set; }
        public bool RememberMe { get; set; }

    }
}
