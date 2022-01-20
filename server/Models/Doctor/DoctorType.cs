using GraphQL.Types;
namespace Server.Models.Doctor
{
    public class DoctorType : ObjectGraphType<Doctor>
    {
        public DoctorType()
        {
            Name = "Doctor";
            Field(x => x.Id).Description("Doctor Id");
            Field(x => x.Rating).Description("A user rating value 1-5 based on the doctors ablity and effectiveness");
            Field(x => x.Longitude).Description("The Longitude coordinate of this doctors clinic location");
            Field(x => x.Latitude).Description("The Latitude coordinate of this doctors clinic location");
            Field(x => x.OpenHours).Description("A string value repersenting the hours that this doctor is available");
        }

    }
}