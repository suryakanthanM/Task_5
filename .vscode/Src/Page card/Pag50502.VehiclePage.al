page 50513 "Vehicle Page"
{
    ApplicationArea = All;
    Caption = 'Vehicle Page';
    PageType = Card;
    SourceTable = "Vehicle details";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Vin_No."; Rec."Vin_No.")
                {
                    ToolTip = 'Specifies the value of the Vin_No. field.', Comment = '%';


                }
                // field(Customer_Name; Rec.Customer_Name)
                // {
                //     ToolTip = 'Specifies the value of the Customer_Name field.', Comment = '%';
                // }
                // field("Customer_No."; Rec."Customer_No.")
                // {
                //     ToolTip = 'Specifies the value of the Customer_No. field.', Comment = '%';
                // }
                field("Model No."; Rec."Model No.")
                {
                    ToolTip = 'Specifies the value of the Model No. field.', Comment = '%';
                }
                field("Rental Customer"; Rec."Rental Customer")
                {
                    TableRelation = Customer;
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
                    ToolTip = 'Specifies the value of the Brand_ Name field.', Comment = '%';
                }


                field(Color; Rec.Color)
                {
                    ToolTip = 'Specifies the value of the Color field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Fule_Type; Rec.Fule_Type)
                {
                    ToolTip = 'Specifies the value of the Fule_Type field.', Comment = '%';
                }
                field(Mileage; Rec.Mileage)
                {
                    ToolTip = 'Specifies the value of the Mileage field.', Comment = '%';
                }


                field(Data_Of_Manufacture; Rec.Data_Of_Manufacture)
                {
                    ToolTip = 'Specifies the value of the Data_Of_Manufacture field.', Comment = '%';
                }
                field(Start_Date; Rec.Start_Date)
                {
                    ToolTip = 'Specifies the value of the Start_Data field.', Comment = '%';
                }

                field(Expire_Date; Rec.Expire_Date)
                {
                    ToolTip = 'Specifies the value of the Expire_Date field.', Comment = '%';
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
}
