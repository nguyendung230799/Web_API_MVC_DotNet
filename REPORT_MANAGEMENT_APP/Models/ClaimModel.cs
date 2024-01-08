using System.Security.Claims;

namespace REPORT_MANAGEMENT_APP.Models
{
    public class ClaimModel : Claim
    {
        public ClaimModel(string x, string y) : base(x, y) { }
        public ClaimModel(ClaimTypesExtension x, ClaimValuesExtension y) : base(x.ToString(), y.ToString()) {}
        public ClaimModel(ClaimTypesExtension x, string y) : base(x.ToString(), y ?? string.Empty) {}
    }
}
