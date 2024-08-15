import SwiftUI

struct DataPoint: Identifiable {
  let id = UUID()
  let label: String
  let value: Double
}

struct BarChartView: View {
  let title: String
  let xAxisLabel: String
  let yAxisLabel: String
  let yAxisUnit: String
  let dataPoints: [DataPoint]

  var body: some View {
    VStack {
      HStack(alignment: .bottom) {
        ForEach(self.dataPoints) { dataPoint in
          Rectangle()
            .fill(.red)
            .frame(width: 20, height: dataPoint.value * 30)
        }
      }
      .accessibilityElement()
      .accessibilityLabel("グラフ")
      .accessibilityChartDescriptor(self)

      Text(self.title)
        .font(.title)
        .bold()
        .padding()
        .accessibilityAddTraits(.isHeader)
    }
  }
}

extension BarChartView: AXChartDescriptorRepresentable {
  func makeChartDescriptor() -> AXChartDescriptor {
    let xAxis = AXCategoricalDataAxisDescriptor(
      title: self.xAxisLabel,
      categoryOrder: self.dataPoints.map(\.label)
    )

    let min = self.dataPoints.map(\.value).min() ?? 0.0
    let max = self.dataPoints.map(\.value).max() ?? 0.0

    let yAxis = AXNumericDataAxisDescriptor(
      title: self.yAxisLabel,
      range: min...max,
      gridlinePositions: []
    ) { value in "\(value)\(self.yAxisUnit)" }

    let series = AXDataSeriesDescriptor(
      name: "",
      isContinuous: false,
      dataPoints: dataPoints.map {
        .init(x: $0.label, y: $0.value)
      }
    )

    return AXChartDescriptor(
      title: self.title,
      summary: nil,
      xAxis: xAxis,
      yAxis: yAxis,
      additionalAxes: [],
      series: [series]
    )
  }
}

struct ContentView: View {
  let dataPoints = [
    DataPoint(label: "1月1日", value: 6.0),
    DataPoint(label: "1月2日", value: 7.0),
    DataPoint(label: "1月3日", value: 8.0),
    DataPoint(label: "1月4日", value: 9.0),
    DataPoint(label: "1月5日", value: 10.0),
    DataPoint(label: "1月6日", value: 6.0),
    DataPoint(label: "1月7日", value: 7.0),
    DataPoint(label: "1月8日", value: 8.0),
    DataPoint(label: "1月9日", value: 9.0),
    DataPoint(label: "1月10日", value: 10.0),
  ]

  var body: some View {
    BarChartView(
      title: "通信量の推移",
      xAxisLabel: "日付",
      yAxisLabel: "データ量",
      yAxisUnit: "GB",
      dataPoints: self.dataPoints
    )
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
