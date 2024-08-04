import { webview } from '@kit.ArkWeb'
import { BottomNavBar } from './BottomNavigatBar'

@Entry
@Component
struct TabsPages {
  private swiperController: SwiperController = new SwiperController()
  @State controller: webview.WebviewController = new webview.WebviewController()
  @State defSelTabData: boolean[] = [true, false]
  @State defSwiperList: string[] = ['https://www.baidu.com', 'https://wanandroid.com']

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column }) {
        Swiper(this.swiperController) {
          ForEach(this.defSwiperList, (item: string) => {
            Web({
              src: item,
              controller: this.controller
            })
          })
        }
        .loop(false)
        .disableSwipe(true)
        .indicator(false)
        .backgroundColor(Color.Blue)
        .flexGrow(1)
        .width('100%')

        BottomNavBar({
          defSelTabData: $defSelTabData,
          barHeight: 70,
          clickTab: (item, index) => {
            console.log('item' + item + " " + index)
            if (index === 1) {
              this.defSelTabData = [false, true]
              this.swiperController.changeIndex(index)
            } else {
              this.swiperController.changeIndex(index)
            }
          }
        })
      }
    }
  }
}