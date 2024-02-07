import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTableOrderOpenWeb extends StatelessWidget {
  const HeaderTableOrderOpenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 87.w,
        top: 44.h,
        right: 30.w,
      ),
      child: Table(
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Text(
                  tr('trade.date'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Text(
                  tr('trade.market_pair'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Text(
                  tr('trade.side'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Text(
                  tr('trade.type'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Text(
                  tr('trade.price'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Text(
                  tr('trade.amount'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Text(
                  tr('trade.total'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Text(
                  tr('trade.executed'),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1.sp,
                        color: Theme.of(context).primaryColor.withOpacity(0.25),
                      ),
                ),
              ),
              const TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
