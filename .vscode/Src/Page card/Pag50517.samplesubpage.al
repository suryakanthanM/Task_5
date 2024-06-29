page 50517 "sample_subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Agreement_Line;
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    LinksAllowed = true;
    InsertAllowed = true;
    Editable = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Agreement No."; Rec."Agreement No.")
                {
                    ApplicationArea = All;
                    visible=false;

                }
                   field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                    visible=false;
                }
                 field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                  field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit price field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
               
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Quantity Invoiced"; Rec."Quantity Invoiced")
                {
                    ToolTip = 'Specifies the value of the Quantity Invoiced field.', Comment = '%';
                }
                field("Quantity to invoice"; Rec."Quantity to invoice")
                {
                    ToolTip = 'Specifies the value of the Quantity to invoice field.', Comment = '%';
                }
              
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}