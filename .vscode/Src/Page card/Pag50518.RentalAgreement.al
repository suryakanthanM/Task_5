page 50518 "Rental Agreement"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Agreement_Header;
    RefreshOnActivate = true;
    InsertAllowed = true;
    Editable = true;
    DeleteAllowed = true;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {


                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Agreement No. field.', Comment = '%';

                }
                field("Vin No."; Rec."Vin No.")
                {
                    ToolTip = 'Specifies the value of the VIN No. field.', Comment = '%';
                    trigger OnValidate()
                    var
                        VehicleDetails: Record "Vehicle details";
                    begin
                        if VehicleDetails.Get(Rec."Vin No.") then begin
                            Rec.Brand := VehicleDetails.Description;
                            Rec.Color := VehicleDetails.Color;
                            Rec."Fuel Type" := VehicleDetails.Fule_Type;
                            Rec."Model No." := VehicleDetails."Model No.";
                            Rec."Rental Customer" := VehicleDetails."Rental Customer";
                            Rec."Customer Name" := VehicleDetails."Customer Name";
                        end;
                    end;
                }
                field("Model No."; Rec."Model No.")
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                    Editable = False;
                }
                field("Rental Customer"; Rec."Rental Customer")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        VehicleDetails: Record "customer";
                    begin
                        if VehicleDetails.Get(Rec."Vin No.") then begin

                            Rec."Customer Name" := VehicleDetails.Name;
                        end;
                    end;
                }
                Field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Editable = False;

                }
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Specifies the value of the Brand field.', Comment = '%';
                    Editable = false;
                }


                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    // trigger OnValidate()
                    // var
                    //     Agree_line: Record Agreement_Line;
                    // begin
                    //     Agree_line.SetRange("Agreement No.", Rec."No.");
                    //     Agree_Line.FindSet();
                    //     Agree_line.Description := Rec.Description;
                    //     Agree_Line.Modify();
                    //     CurrPage.Update(true);

                    // end;

                }

                field("Access of car"; Rec."Access of car")
                {
                    ToolTip = 'Specifies the value of the Access of car field.', Comment = '%';
                }
                field("Charge per Invoice"; Rec."Charge per Invoice")
                {
                    ToolTip = 'Specifies the value of the Charge Per Invoice field.', Comment = '%';
                }
                field(Color; Rec.Color)
                {
                    ToolTip = 'Specifies the value of the Color field.', Comment = '%';
                    Editable = false;
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ToolTip = 'Specifies the value of the Fuel Type field.', Comment = '%';
                    Editable = false;
                }
                field(Mileage; Rec.Mileage)
                {
                    ToolTip = 'Specifies the value of the Mileage field.', Comment = '%';
                }

                field("Year of manufacture"; Rec."Year of manufacture")
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }

                field("Rental Start Date"; Rec."Rental Start Date")
                {
                    ApplicationArea = All;
                }
                field("Rental Expire Date"; Rec."Rental Expire Date")
                {
                    ApplicationArea = All;
                }
                // field("Invoice Frequency"; Rec."Invoice Frequency")
                // {
                //     ToolTip = 'Specifies the value of the Invoice Frequency field.', Comment = '%';
                // }
                field("Customer Support By"; Rec."Customer Support By")
                {
                    ToolTip = 'Specifies the value of the Customer Support By field.', Comment = '%';
                }
                field("Exiting Damage"; Rec."Exiting Damage")
                {
                    ToolTip = 'Specifies the value of the Exiting Damage field.', Comment = '%';
                    multiline = true;
                }
                field("Mileage Limited"; Rec."Mileage Limited")
                {
                    ToolTip = 'Specifies the value of the Mileage Limit For Customer field.', Comment = '%';
                }
                field("Security Deposit"; Rec."Security Deposit")
                {
                    ToolTip = 'Specifies the value of the Security Deposit field.', Comment = '%';
                }

            }
            part("sample_subpage"; "sample_subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Agreement No." = field("No.");
                UpdatePropagation = Both;

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Customer)
            {
                ApplicationArea = All;
                image = Customer;
                //  RunObject = page "Customer Card";                       //{ First way to set action with opening customer cardbased on Rental customer}
                // RunPageLink = "No." = field("Rental Customer");     


                trigger OnAction()
                var
                    Customername: Record Customer;

                begin
                    Customername.SetRange("No.", Rec."Rental Customer");
                    // if Customername.Get(Rec."Rental Customer") then       //{ Secont way to set action with opening customer card based on Rental customer}
                    //     Page.Run(Page::"Customer Card", Customername);      
                    if Customername.FindFirst() then
                        Page.Run(Page::"Customer Card", Customername);
                end;
            }

            action(VehicleDetails)
            {
                ApplicationArea = All;
                image = GoTo;
                trigger OnAction()
                var
                    Vehicledel: Record "Vehicle details";
                begin
                    if Vehicledel.Get(Rec."Vin No.") then
                        page.Run(Page::"Vehicle Page", Vehicledel);
                end;
            }
            action(ItemDetails)
            {
                ApplicationArea = All;
                Image = Item;
                trigger OnAction()
                var
                    ItemDetails: Record Customer;
                begin
                    ItemDetails.SetRange("No.", Rec."Rental Customer");
                    if ItemDetails.FindFirst() then
                        Report.Run(Report::"Customer - List", false, True, ItemDetails);
                end;

            }
            action(Sales_Order)
            {
                ApplicationArea = All;
                Image = Order;
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    SalesLine: Record "Sales Line";
                    LineNO: Integer;
                    AgreementLine: Record Agreement_Line;
                begin
                    SalesHeader.Init();
                    SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                    SalesHeader."No." := ' ';
                    SalesHeader.Insert(true);
                    SalesHeader."Sell-to Customer No." := Rec."Rental Customer";
                    SalesHeader."Sell-to Customer Name" := Rec."Customer Name";
                    SalesHeader."Your Reference" := Rec."No.";
                    SalesHeader.Modify(true);
                    AgreementLine.SetRange("Agreement No.", Rec."No.");
                    if AgreementLine.FindSet() then
                        repeat
                            SalesLine.Init();
                            SalesLine."Document Type" := SalesHeader."Document Type"::Order;
                            SalesLine."Document No." := SalesHeader."No.";
                            SalesLine.SetRange("Line No.", SalesLine."Line No.");
                            if SalesLine.FindLast() then
                                LineNO := SalesLine."Line No." + 1000
                            else
                                LineNO := 10000;
                            SalesLine."Line No." := LineNO;
                            SalesLine.Insert(true);
                            // SalesLine.Validate("No.", AgreementLine."Item No.");

                            repeat
                                AgreementLine."Quantity Invoiced" += 1;
                                AgreementLine.Modify(true);
                                SalesLine."No." := AgreementLine."Item No.";
                                salesLine.Description := AgreementLine.Description;
                                SalesLine.Modify(true);
                                CurrPage.Update();
                            until AgreementLine.Next() = 0;

                        until AgreementLine.Next() = 0;
                    Message('Sales Order is created.');
                end;
            }
            action(Purchase_Order)
            {
                ApplicationArea = All;
                Image = Purchase;

                trigger OnAction()
                var
                    PurchaseHead: Record "Purchase Header";
                    PurchaseLine: Record "Purchase Line";
                    LineNo: Integer;
                    AgreementLine: Record Agreement_Line;
                begin
                    PurchaseHead.Init();
                    PurchaseHead."Document Type" := PurchaseHead."Document Type"::Order;
                    PurchaseHead."No." := ' ';
                    PurchaseHead.Insert(True);
                    PurchaseHead."Buy-from Vendor Name" := Rec."Customer Name";
                    PurchaseHead."Vendor Shipment No." := Rec."No.";
                    PurchaseHead.Modify(True);


                    AgreementLine.SetRange("Agreement No.", Rec."No.");
                    if AgreementLine.FindSet() then
                        repeat
                            PurchaseLine.Init();
                            PurchaseLine."Document Type" := PurchaseHead."Document Type"::Order;
                            PurchaseLine."Document No." := PurchaseHead."No.";
                            PurchaseLine.SetRange("Line No.", PurchaseLine."Line No.");
                            if PurchaseLine.FindLast() then
                                LineNo := purchaseLine."Line No." + 10000
                            else
                                LineNo := 20000;
                            PurchaseLine."Line No." := LineNo;
                            PurchaseLine.Insert(True);
                            //PurchaseLine.Validate("No.", AgreementLine."Item No.");
                            PurchaseLine."No." := AgreementLine."Item No.";
                            AgreementLine."Quantity Invoiced" += 1;
                            AgreementLine.Modify(True);
                            PurchaseLine.Modify(True);
                        until AgreementLine.Next() = 0;

                    Message('Purchase Order Created');

                end;
            }

        }
    }

    var
        myInt: Integer;
}