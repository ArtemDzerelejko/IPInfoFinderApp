//
//  IPInfoView.swift
//  IPInfoFinder
//
//  Created by artem on 25.08.2024.
//

import SwiftUI

struct IPInfoView: View {
    let ipInfo: IPInfo
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(IPInfoRowType.allCases, id: \.self) { rowType in
                        createInfoRow(for: rowType)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(AppColors.greyBlue, lineWidth: 1)
                )
            }
            .scrollDisabled(false)
            .scrollIndicators(.hidden)
        } else {}
    }
}

// MARK: - IPInfoView Extension
private extension IPInfoView {
    @ViewBuilder
    func createInfoRow(for rowType: IPInfoRowType) -> some View {
        switch rowType {
        case .ip:
            InfoRow(title: InfoTitles.ip, value: ipInfo.ip)
        case .hostname:
            InfoRow(title: InfoTitles.hostname, value: ipInfo.hostname)
        case .city:
            InfoRow(title: InfoTitles.city, value: ipInfo.city)
        case .region:
            InfoRow(title: InfoTitles.region, value: ipInfo.region)
        case .country:
            InfoRow(title: InfoTitles.country, value: ipInfo.country)
        case .location:
            locationInfoRow
        case .organization:
            InfoRow(title: InfoTitles.organization, value: ipInfo.org)
        case .postal:
            InfoRow(title: InfoTitles.postal, value: ipInfo.postal)
        case .timezone:
            InfoRow(title: InfoTitles.timezone, value: ipInfo.timezone)
        case .readme:
            readmeInfoRow
        }
    }
    
    var locationInfoRow: some View {
        InfoRow(
            title: InfoTitles.location,
            value: ipInfo.loc,
            valueColor: AppColors.blueMain,
            isValueButton: true,
            destination: {
                AnyView(
                    MapView(
                        latitude: ipInfo.latitude,
                        longitude: ipInfo.longitude,
                        cityName: ipInfo.city
                    )
                )
            }
        )
    }
    
    var readmeInfoRow: some View {
        InfoRow(
            title: InfoTitles.readme,
            value: ipInfo.readme,
            valueColor: AppColors.blueMain,
            isValueButton: true,
            onValueTap: {
                if let url = URL(string: ipInfo.readme) {
                    UIApplication.shared.open(url)
                }
            }
        )
    }
}

// MARK: - IPInfoRowType
enum IPInfoRowType: CaseIterable {
    case ip, hostname, city, region, country, location, organization, postal, timezone, readme
}
