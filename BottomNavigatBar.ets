import { NavBarBean as NavTabBean } from '../mode/NavBarBean';

@Component
export struct BottomNavBar {
  @State defTabData: Array<NavTabBean> = [
    {
      name: '首页',
      defImg: $r('app.media.ic_home'),
      selImg: $r('app.media.ic_home_selected'),
      defTxtColor: Color.Black,
      selTxtColor: Color.Blue
    },
    {
      name: '我的',
      defImg: $r('app.media.ic_me'),
      selImg: $r('app.media.ic_me_selected'),
      defTxtColor: Color.Black,
      selTxtColor: Color.Blue
    },
  ]
  @Link defSelTabData: boolean[]
  @State barHeight: number = 0;
  @State barBackgroundColor: ResourceColor = 0;
  clickTab: (item: NavTabBean, index: number) => void = () => {
  }

  setTabSelect(index: number) {
    if (index === 0) {
      if (this.defSelTabData[index] === false) {
        this.defSelTabData = [true, false];
      }
    }
    if (index === 1) {
      if (this.defSelTabData[index] === false) {
        this.defSelTabData = [false, true];
      }
    }
  }

  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
      ForEach(this.defTabData, (item: NavTabBean, index) => {
        Column() {
          Image(this.defSelTabData[index] ? item.selImg : item.defImg).width(30)
          Text(item.name).margin({ top: 8 }).fontColor(this.defSelTabData[index] ? item.selTxtColor : item.defTxtColor)
        }.onClick(() => {
          if (index === 1) {
            this.clickTab(item, index)
            return
          }
          this.clickTab(item, index)
          this.setTabSelect(index)
        })
      })
    }
    .width('100%')
    .backgroundColor(this.barBackgroundColor != 0 ? this.barBackgroundColor : '#ffffff')
    .height(this.barHeight ? this.barHeight : 70)
  }
}



