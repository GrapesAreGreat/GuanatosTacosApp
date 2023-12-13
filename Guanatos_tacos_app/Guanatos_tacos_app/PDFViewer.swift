import SwiftUI
import PDFKit
struct PDFViewer: UIViewRepresentable {
    let pdfDocument: PDFDocument

    init(url: URL) {
        if let document = PDFDocument(url: url) {
            self.pdfDocument = document
        } else {
            self.pdfDocument = PDFDocument()
        }
    }

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
    }
}

struct MenuView: View {
    var body: some View {
        if let url = Bundle.main.url(forResource: "menu", withExtension: "pdf") {
            PDFViewer(url: url)
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("Unable to find the menu.")
        }
    }
}
