using AutoMapper;
using REPORT_MANAGEMENT_CORE.Data.Domains;
using REPORT_MANAGEMENT_APP.Models;
using System.Web.Mvc;
using REPORT_MANAGEMENT_CORE.Data.Query;

namespace REPORT_MANAGEMENT_APP.Configurations
{
    public class MapperConfiguration : Profile
    {
        public MapperConfiguration()
        {
            CreateMap<FileModel, File>().ReverseMap();
            CreateMap<FolderModel, Folder>().ReverseMap();
            CreateMap<CatalogueBudgetModel, CatalogueBudget>().ReverseMap();
            CreateMap<CatalogueDepartmentModel, CatalogueDepartment>().ReverseMap();
            CreateMap<UserModel, ApplicationUser>().ReverseMap();
            CreateMap<UserRoleQuery, ApplicationUser>().ReverseMap();
            CreateMap<UserRoleModel, ApplicationUser>();
            CreateMap<ApplicationUser, UserRoleModel>()
                .ForMember(x => x.UserId, y => y.MapFrom(z => z.Id));


            CreateMap<UserModel, SelectListItem>()
                .ForMember(item => item.Value, y => y.MapFrom(z => z.ParentId))
                .ForMember(x => x.Text, y => y.MapFrom(z => $"{z.Name} - {z.Code}"));

            CreateMap<ChangeAgencyViewModel, UserModel>()
                .ForMember(x => x.Name, y => y.MapFrom(z => z.AgencyName))
                .ForMember(x => x.Code, y => y.MapFrom(z => z.AgencyCode))
                .ForMember(x => x.Rank, y => y.MapFrom(z => z.AgencyLevel))
                .ForMember(x => x.ParentId, y => y.MapFrom(z => z.AgencyParent))
                .ForMember(x => x.Department, y => y.MapFrom(z => z.AgencyDepartment)).ReverseMap();

        }
    }
}
