report 1 CustomerList
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = "Customer List Report";
    
    dataset
    {
        dataitem(Customer; Customer)
        {
           
            
        }
    }
    
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                        
                    }
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;
                    
                }
            }
        }
    }
    
    rendering
    {
        layout(LayoutName)
        {
            Type = Excel;
            LayoutFile = 'mySpreadsheet.xlsx';
        }
    }
    
    var
        myInt: Integer;
}