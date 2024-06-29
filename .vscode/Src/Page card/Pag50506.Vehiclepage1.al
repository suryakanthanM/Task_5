page 50516 "Vehicle page1"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Vehicle details";
    CardPageId = "Vehicle Page";
    Editable = false;
    DeleteAllowed = false;
    layout
    {
        area(Content)
        {
            repeater(Vehicle)
            {
                field("Vin_No."; Rec."Vin_No.")
                {
                    ApplicationArea = All;
                    NotBlank = true;

                }

                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = All;
                }
                field("Rental Customer"; Rec."Rental Customer")
                {
                    TableRelation=Customer;
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        VehicleDetails: Record Customer;
                    begin
                        if VehicleDetails.Get(Rec."Rental Customer") then begin
                            Rec."Customer Name" := VehicleDetails.Name;
                        end;
                    end;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Brand_ Name"; Rec."Brand_ Name")
                {
                    ApplicationArea = All;

                }
                field(Color; Rec.Color)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Mileage; Rec.Mileage)
                {
                    ApplicationArea = All;

                }
                field(Data_Of_Manufacture; Rec.Data_Of_Manufacture)
                {
                    ApplicationArea = All;
                }
                field(Start_Date; Rec.Start_Date)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Expire_Date; Rec.Expire_Date)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Fule_Type; Rec.Fule_Type)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {

            action(CustomerDetails)
            {
                ApplicationArea = All;
                image = Customer;
                caption = 'Customer';
                trigger OnAction()

                var
                    CustomerDetail: Record Customer;
                begin
                    CustomerDetail.SetRange("No.", Rec."Rental Customer");
                    if CustomerDetail.FindFirst() then
                        Page.Run(Page::"Customer Card", CustomerDetail);
                end;


            }
            action(ItemDetails)
            {
                ApplicationArea = All;
                Image = Item;
                trigger OnAction()
                var
                    ItemDetails: Record Item;
                begin
                    ItemDetails.SetRange("No.", Rec."Model No.");
                    if ItemDetails.FindFirst() then
                        page.Run(page::"Item Card", ItemDetails);
                end;

            }


        }
    }

    var
        myInt: Integer;
}

